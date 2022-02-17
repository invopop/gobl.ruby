module Generators
  class Ruby
    module TypeHelpers
      def json_schema_type_map
        @json_schema_type_map ||= {
          'string' => 'String',
          'number' => 'Double',
          'integer' => 'Int',
          'boolean' => 'Bool',
          'object' => 'Hash',
          'array' => 'Array',
          'null' => 'Nil'
        }
      end

      def gobl_type_from_json_schema(type)
        json_schema_type_map[type] || 'Any'
      end

      def gobl_type_string(name, property)
        if property.ref.present?
          gobl_type_from_reference(property.ref)
        elsif property.type.array?
          "GOBL::Types::Array(#{gobl_type_string(name, property.items)})"
        else
          "GOBL::Types::#{gobl_type_from_json_schema(property.type.to_s)}"
        end
      end

      def gobl_type_from_reference(ref)
        if ref.fragment.present?
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
            mods << m.camelize
          end
          mods << ref.name.camelize
        end
        mods.join('::')
      end
    end
  end
end
