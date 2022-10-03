# frozen_string_literal: true

module Generators
  class Ruby
    module TypeHelpers
      def json_schema_type_map
        @json_schema_type_map ||= {
          'string' => { gobl: 'GOBL::Types::String', ruby: 'String' },
          'number' => { gobl: 'GOBL::Types::Double', ruby: 'Float' },
          'integer' => { gobl: 'GOBL::Types::Int', ruby: 'Integer' },
          'boolean' => { gobl: 'GOBL::Types::Bool', ruby: 'Boolean' },
          'object' => { gobl: 'GOBL::Types::Hash', ruby: 'Hash' },
          'array' => { gobl: 'GOBL::Types::Array', ruby: 'Array' },
          'null' => { gobl: 'GOBL::Types::Nil', ruby: 'NilClass' }
        }.tap do |map|
          map.default = { gobl: 'GOBL::Types::Any', ruby: 'Object' }
        end
      end

      def gobl_custom_ref_map
        @gobl_custom_ref_map ||= {
          'https://gobl.org/draft-0/num/amount' => 'GOBL::Num::Amount',
          'https://gobl.org/draft-0/num/percentage' => 'GOBL::Num::Percentage'
        }
      end

      # Provide a safe property symbol from the name, as Ruby and specifically
      # Dry::Struct doesn't play nice with `$` in symbols
      def safe_property_name(name)
        name.gsub(/^\$/, '')
      end

      def gobl_type_string(property)
        type_string property, {
          custom_ref: -> { "GOBL::Types.Constructor(#{gobl_custom_ref_map[property.ref.to_s]})" },
          array: -> { "GOBL::Types::Array.of(#{gobl_type_string(property.items)})" },
          type: -> { json_schema_type_map[property.type.to_s][:gobl] }
        }
      end

      def ruby_type_string(property)
        type_string property, {
          custom_ref: -> { gobl_custom_ref_map[property.ref.to_s] },
          array: -> { "Array<#{ruby_type_string(property.items)}>" },
          type: -> { json_schema_type_map[property.type.to_s][:ruby] }
        }
      end

      # Template pattern customised by the procs in the `builders` argument
      def type_string(property, builders = {})
        if property.ref.present?
          if gobl_custom_ref_map.key?(property.ref.to_s)
            builders[:custom_ref].call
          else
            gobl_type_from_reference(property.ref)
          end
        elsif property.type.array?
          builders[:array].call
        else
          builders[:type].call
        end
      end

      def gobl_type_from_reference(ref)
        c = gobl_custom_ref_map[ref.to_s]
        if c.present?
          c
        elsif ref.fragment.present?
          m = ref.fragment.match(%r{^/\$defs/(.+)})
          m[1] # already in CamelCase
        elsif ref.gobl?
          gobl_type_from_id(ref)
        else
          raise "unknown type: #{ref}"
        end
      end

      def gobl_type_from_id(ref)
        # extract from URL
        mods = ['GOBL']
        if ref.module.present?
          ref.module.split('/').each do |m|
            mods << m.underscore.camelize
          end
          mods << ref.name.underscore.camelize
        end
        mods.join('::')
      end

      def serialize_str(str)
        "'#{str.gsub("'", "\\'")}'"
      end
    end
  end
end
