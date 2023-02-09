# frozen_string_literal: true

module Generators
  class Markdown
    # Base generator of a json schema of type array
    class Array < Struct
      def module_content
        <<~EOFMOD
        An array of `#{type_string(schema.items)}`

        #{"#{schema.description}" if schema.description.present?}
        EOFMOD
      end
    end
  end
end
