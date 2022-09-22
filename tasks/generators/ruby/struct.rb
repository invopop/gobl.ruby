module Generators
  class Ruby
    STRUCT_VALUE_NAME = 'value'

    # Struct represents a dry-struct implementation meant to
    # be re-used by the different type use-cases.
    # A struct is meant to have it's methods overidden to cope
    # with a complete scenario according to the object type.
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
        out << "# #{schema.description}\n" if schema.description.present?
        out << <<~EOFMOD
          class #{class_name} < #{parent_class}
            #{schema_id_const}

          #{indent(class_content, 1).chomp}
          end
        EOFMOD
        out
      end

      def parent_class
        "GOBL::Struct"
      end

      def schema_id_const
        "SCHEMA_ID = '#{parent.definition_schema_id(name)}'"
      end

      def class_content
        [
          includes,
          constants,
          attributes,
          from_gobl_method,
          from_json_method,
          to_gobl_method,
          to_json_method,
          additional_methods
        ].flatten.reject(&:blank?).join("\n")
      end

      def includes
        ''
      end

      def constants
        ''
      end

      def attributes
        ''
      end

      def from_gobl_method
        ''
      end

      def to_gobl_method
        ''
      end

      def from_json_method
        ''
      end

      def to_json_method
        ''
      end

      def additional_methods
        ''
      end
    end
  end
end
