# frozen_string_literal: true

module Generators
  class Markdown
    module TypeHelpers
      def json_schema_type_map
        @json_schema_type_map ||=
          {
            "string" => "string",
            "number" => "number",
            "integer" => "integer",
            "boolean" => "boolean",
            "object" => "object",
            "array" => "array",
            "null" => "null",
          }.tap { |map| map.default = "object" }
      end

      def gobl_custom_ref_map
        @gobl_custom_ref_map ||= { }
        #  "https://gobl.org/draft-0/num/amount" => "num/amount",
        #  "https://gobl.org/draft-0/num/percentage" => "num/percentage",
        #}
      end

      def type_string(property, for_yard: false)
        if property.ref.present?
          if gobl_custom_ref_map.key?(property.ref.to_s)
            gobl_custom_ref_map[property.ref.to_s]
          else
            "[#{gobl_type_from_reference(property.ref)}](/draft-0/#{gobl_type_path(property.ref)})"
          end
        elsif property.type.array?
          if for_yard
            "array of #{type_string(property.items, for_yard: false)}"
          else
            "array of #{type_string(property.items, for_yard: true)}"
          end
        else
          json_schema_type_map[property.type.to_s]
        end
      end

      def gobl_type_path(ref)
        gobl_type_from_reference(ref).gsub('.', '/').underscore
      end

      def gobl_type_from_reference(ref) # ref is URL
        c = gobl_custom_ref_map[ref.to_s]
        if c.present?
          c
        elsif ref.fragment.present?
          # in same module
          m = ref.fragment.match(%r{^/\$defs/(.+)})
          (modules + [m[1]]).join(".") # already in CamelCase
        elsif ref.gobl?
          gobl_type_from_id(ref)
        else
          raise "unknown type: #{ref}"
        end
      end

      def gobl_type_from_id(ref)
        # extract from URL
        mods = []
        if ref.module.present?
          ref.module.split("/").each { |m| mods << m.underscore }
          mods << ref.name.underscore.camelize
        end
        mods.join(".")
      end
    end
  end
end
