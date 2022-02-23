module Generators
  class Ruby
    STRUCT_VALUE_NAME = 'value'

    # Struct defines the implementation of a type class from the schema
    # definitions.
    class Struct
      attr_reader :schema, :name, :modules

      def initialize(modules, name, schema)
        @modules = modules
        @name = name
        @schema = schema
      end

      def to_text
        as_text
      end

      private

      def as_text
        # header
        out = <<~EOF
          # frozen_string_literal: true

          ##
          ## DO NOT EDIT - This file was generated automatically.
          ##

          require 'dry-struct'

        EOF
        add_modules(out, modules)
      end

      def add_modules(out, mods, indent = 0)
        if mods.length == 0
          add_class(out, indent)
        else
          mod = mods.shift
          pad = '  ' * indent
          out << "#{pad}module #{mod.camelize}\n"
          add_modules(out, mods, indent + 1)
          out << "#{pad}end\n"
        end
      end

      def add_class(out, indent = 0)
        txt = "class #{class_name} < #{ancestor_class}\n"

        txt << indent(attributes.to_s, 1) if attributes.present?
        txt << indent(from_gobl_method.to_s, 1)
        txt << indent(from_json_method.to_s, 1)
        txt << indent(to_gobl_method.to_s, 1)
        txt << indent(to_json_method.to_s, 1)
        txt << indent(to_s_method.to_s, 1) if schema.properties.empty? && !schema.type.indexable?

        txt << 'end'
        out << indent(txt, indent)
      end

      def indent(str, indent = 0)
        return '' if str.blank?

        out = ''
        pad = '  ' * indent
        str.split("\n").each do |line|
          out << (line.blank? ? "\n" : "#{pad}#{line}\n")
        end
        out
      end

      def class_name
        @name.camelize
      end

      def ancestor_class
        'Dry::Struct'
      end

      def attributes
        @attributes ||= Attributes.new(schema)
      end

      def from_gobl_method
        @from_gobl_method ||= FromGoblMethod.new(schema)
      end

      def to_gobl_method
        @to_gobl_method ||= ToGoblMethod.new(schema)
      end

      def from_json_method
        <<~EOF

          def self.from_json!(json)
            from_gobl!(JSON.parse(json))
          end
        EOF
      end

      def to_json_method
        <<~EOF

          def to_json(options = nil)
            JSON.generate(to_gobl, options)
          end
        EOF
      end

      def to_s_method
        <<~EOF

          def to_s
            #{STRUCT_VALUE_NAME}.to_s
          end
        EOF
      end
    end
  end
end
