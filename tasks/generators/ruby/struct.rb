# frozen_string_literal: true

module Generators
  class Ruby
    STRUCT_VALUE_NAME = 'value'

    # Struct represents a struct implementation meant to be re-used by the different type
    # use-cases. A struct is meant to have it's methods overidden to cope with a complete
    # scenario according to the object type.
    class Struct < Base
      protected

      def content
        <<~EOFCNT
          #{header}
          #{add_modules(modules)}
        EOFCNT
      end

      def module_content
        out = ''
        schema.description.split("\n").each do |line|
          out += "# #{line}\n"
        end if schema.description.present?
        out += "class #{class_name} < #{parent_class}\n"
        out += indent(class_content, 1)
        out += "end\n"
        out
      end

      def class_content
        [schema_id_constant, additional_content].flatten.compact.join("\n")
      end

      def schema_id_constant
        <<~EOFSCH
          # The Schema ID of the GOBL #{name} structure
          SCHEMA_ID = '#{parent.definition_schema_id(name)}'
        EOFSCH
      end

      def parent_class
        raise NotImplementedError
      end

      def additional_content
        ''
      end
    end
  end
end
