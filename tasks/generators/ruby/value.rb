# frozen_string_literal: true

module Generators
  class Ruby
    # Base generator of a json schema of type nil or string
    class Value < Struct
      def parent_class
        'GOBL::Value'
      end

      def additional_content
        return unless schema.enum?

        <<~EOF
          include GOBL::Enum

          # The enumeration of values of the object and their descriptions (Values different to these are #{schema.strict_enum? ? 'not' : 'also'} allowed)
          ENUM = {
            #{schema.enum.map { |key, value| "#{serialize_str(key)} => #{serialize_str(value)}" }.join(",\n  ")}
          }.freeze

          def strict_enum?
            #{schema.strict_enum?}
          end
        EOF
      end
    end
  end
end
