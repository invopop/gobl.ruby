# frozen_string_literal: true

module Generators
  class Ruby
    # Base generator of a json schema of type array
    class Array < Struct
      def module_content
        out = ''
        out += "# #{schema.description}\n" if schema.description.present?
        out += <<~EOFMOD
          #{class_name} = [#{type_string(schema.items)}] # rubocop:disable Naming/ConstantName, Style/MutableConstant
        EOFMOD
        out
      end
    end
  end
end
