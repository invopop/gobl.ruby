# frozen_string_literal: true

module Generators
  class Markdown
    STRUCT_VALUE_NAME = "value"

    # Struct represents a struct implementation meant to be re-used by the different type
    # use-cases. A struct is meant to have it's methods overidden to cope with a complete
    # scenario according to the object type.
    class Struct < Base
      protected

      def content
        <<~EOFCNT
          #{header}
          #{module_content}
        EOFCNT
      end

      def module_content
        <<~EOFMOD
        #{"#{schema.description}" if schema.description.present?}

        #{class_content}
        EOFMOD
      end

      def class_content
        [schema_id_constant, additional_content].flatten.compact.join("\n")
      end

      def schema_id_constant
        <<~EOFSCH
        ## Schema ID

        `#{parent.definition_schema_id(name)}`
        EOFSCH
      end

      def parent_class
        raise NotImplementedError
      end

      def additional_content
        ""
      end
    end
  end
end
