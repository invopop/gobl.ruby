# frozen_string_literal: true

require 'json'
require 'json-schema'

require_relative 'object'
require_relative 'utils'

module Dynamic
  # Struct - Abstract class that represents the common behaviour of a
  # dynamically defined GoBL class.
  class Struct < Dynamic::Object
    extend Utils

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
      definition = strip_definition(ref)
      referenced_schema = get_referenced_schema(schema, parent_schema)

      return [definition, schema] if referenced_schema.nil?

      cp_schema = Marshal.load(Marshal.dump(referenced_schema.schema))
      replace_props(parent_schema, cp_schema)

      [definition, cp_schema]
    end

    # Replaces the properties of the given schema with the referenced schema
    # if it's present. Returning a reference dictionary with each property.
    def self.replace_props(parent_schema, schema = nil)
      sub_schema = schema || json_schema

      return {} unless sub_schema['properties']

      refs = {}
      props = {}

      sub_schema['properties'].each do |p_name, p_schema|
        refs[p_name], props[p_name] = ref_schema(p_name, p_schema, parent_schema)
      end

      sub_schema['properties'] = props

      refs
    end

    # Returns a reference dictionary of the class attributes. Expanding
    # those references with the corresponding JSON schema.
    def self.expand_references(parent_schema)
      @properties_ref = replace_props(parent_schema)
    end

    # Returns the referenced schema definition.
    def self.get_referenced_schema(sch, p_sch)
      kls = JSON::Schema::RefAttribute
      _, ref = kls.get_referenced_uri_and_schema(sch, p_sch, p_sch.validator)
      ref
    end
  end
end
