# frozen_string_literal: true

module Generators
  class Ruby
    # Base generator of a json schema of type nil or string
    class Value < Struct
      def parent_class
        enum? ? 'GOBL::Enum' : 'GOBL::Value'
      end

      def additional_content
        [enum_constant, strict_enum]
      end

      def enum_constant
        return unless enum?

        <<~EOFCONST
          # The enumeration of values of the object and their descriptions (Values different to these are #{strict_enum? ? 'not' : 'also'} allowed)
          ENUM = {
            #{enum_hash.map { |key, value| "#{serialize_str(key)} => #{serialize_str(value)}" }.join(",\n  ")}
          }.freeze
        EOFCONST
      end

      def strict_enum
        return unless strict_enum?

        <<~EOFADD
          def strict_enum?
            true
          end
        EOFADD
      end

      def enum_hash
        @enum_hash ||=
          schema.composition&.entries
            &.filter(&:const?)
            &.to_h { |e| [e.const, e.description] }
      end

      def enum?
        enum_hash.present?
      end

      def strict_enum?
        enum? && schema.composition.entries.all?(&:const?)
      end
    end
  end
end
