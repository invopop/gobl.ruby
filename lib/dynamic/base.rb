# frozen_string_literal: true

require 'json'
require 'json-schema'

require_relative 'object'

module Dynamic
  # Base - This abstract class represent the base behaviour of the dynamic
  # defined GoBL classes.
  class Base < Dynamic::Object
    # Defines the setters and getters of the class based on the properties
    # in the JSON schema.
    def self.define_props
      props = json_schema['properties']

      return if props.nil?

      props.each_key do |name|
        attr_accessor name.to_sym
      end
    end

    # Looks for the referenced JSON schema using the parent to search the
    # definition. If the schema is an array, it goes recursively with the
    # item's schema. A referenced schema might also have references. In
    # that case, the method also replace those schema references. Making
    # this method corecursive with 'replace_props'.
    def self.ref_schema(name, schema, parent_schema)
      ref = schema['$ref']
      return resolve_ref(ref, schema, parent_schema) unless ref.nil?

      definition = nil
      items = schema['items']
      unless items.nil?
        definition, item_schema = ref_schema(name, items, parent_schema)
        schema['items'] = item_schema
      end

      [definition, schema]
    end

    def self.resolve_ref(ref, schema, parent_schema)
      definition = Dynamic.strip_definition(ref)
      referenced_schema = get_referenced_schema(schema, parent_schema)

      return [definition, schema] if referenced_schema.nil?

      cp_schema = Marshal.load(Marshal.dump(referenced_schema.schema))
      replace_props(cp_schema, parent_schema)

      [definition, cp_schema]
    end

    # Replace the properties of the given schema with the referenced schema
    # if present. Returning a reference dictionary for each property.
    def self.replace_props(schema, p_sch)
      props = schema['properties']

      return {} if props.nil?

      temp_refs = {}
      new_props = {}

      props.each do |name, prop_schema|
        temp_refs[name], new_props[name] = ref_schema(name, prop_schema, p_sch)
      end

      schema['properties'] = new_props

      temp_refs
    end

    # Returns a reference dictionary of the class attributes. Expanding
    # those references with the corresponding JSON schema.
    def self.expand_references(parent_schema)
      @refs = replace_props(json_schema, parent_schema)
    end

    # Returns the referenced schema definition.
    def self.get_referenced_schema(sch, p_sch)
      kls = JSON::Schema::RefAttribute
      _, ref = kls.get_referenced_uri_and_schema(sch, p_sch, p_sch.validator)
      ref
    end

    def self.attribute_type(props, att, items)
      raw_type = props.dig(att, 'type')
      pfx_type = Types.lookup(raw_type, props.dig(att, '$ref'))

      if Types.array?(raw_type)
        sub_type = Types.array_type(items['type'], items['$ref'])

        "#{pfx_type}(#{sub_type})"
      else
        pfx_type
      end
    end

    def self.attributes_string
      props = (original_json_schema['properties'] || {})
      required = (original_json_schema['required'] || [])

      attrs = refs.keys.empty? ? ['value'] : refs.keys
      attrs.map do |att|
        optional = required.include?(att) ? '' : '.optional'
        type = attribute_type(props, att, props.dig(att, 'items'))

        "attribute :#{att}, #{type}#{optional}"
      end.join("\n")
    end

    def self.to_ruby # rubocop:disable Metrics/MethodLength
      %(
        class #{self} < #{ancestors[1]}
          #{attributes_string}

          def self.refs
            @refs ||= {
              #{
                refs.to_a.map do |t|
                  "#{t[0].inspect} => #{Dynamic.lookup(t[1]) || 'nil'},"
                end.join("\n")
              }
            }
          end
        end
      )
    end

    ########################################################
    # Export Section
    ########################################################

    def self.save_to(path)
      filepath = "#{path}.rb"

      f = File.new(filepath, 'w')
      f.write(to_ruby)
      f.close
    end

    def self.export(path: nil)
      return unless path

      filepath = to_s.split('::').map { |segment| Dynamic.path_name(segment) }

      dir = filepath.unshift(path).join('/')
      save_to(Dynamic.mkdir(dir))
    end
  end
end
