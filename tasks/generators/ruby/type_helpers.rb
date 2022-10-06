# frozen_string_literal: true

module Generators
  class Ruby
    module TypeHelpers
      def json_schema_type_map
        @json_schema_type_map ||= {
          'string' => 'String',
          'number' => 'Float',
          'integer' => 'Integer',
          'boolean' => 'Boolean',
          'object' => 'Hash',
          'array' => 'Array',
          'null' => 'NilClass'
        }.tap do |map|
          map.default = 'Object'
        end
      end

      def gobl_custom_ref_map
        @gobl_custom_ref_map ||= {
          'https://gobl.org/draft-0/num/amount' => 'GOBL::Num::Amount',
          'https://gobl.org/draft-0/num/percentage' => 'GOBL::Num::Percentage'
        }
      end

      def type_string(property, for_yard: false)
        if property.ref.present?
          if gobl_custom_ref_map.key?(property.ref.to_s)
            gobl_custom_ref_map[property.ref.to_s]
          else
            gobl_type_from_reference(property.ref)
          end
        elsif property.type.array?
          if for_yard
            "Array<#{type_string(property.items, for_yard: false)}>"
          else
            "[#{type_string(property.items, for_yard: true)}]"
          end
        else
          json_schema_type_map[property.type.to_s]
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
