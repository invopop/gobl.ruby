# frozen_string_literal: true

module Generators
  class Ruby
    # Base generator of a json schema of type nil or string
    class Value < Struct
      include EnumHelpers

      def parent_class
        type_string schema
      end

      def additional_content
        return unless schema.enum?
        <<~EOF
          include GOBL::Enum

          #{render_enum(schema.enum).chomp}

          def strict_enum?
            #{schema.strict_enum?}
          end
        EOF
      end
    end
  end
end
