# frozen_string_literal: false

module Generators
  class Ruby
    # Render a `from_gobl!` class method.
    class FromGoblMethod
      include TypeHelpers

      PARAM_NAME = 'data'

      def initialize(schema)
        @schema = schema
        @properties = @schema.properties
        @is_value = @schema.properties.empty?
      end

      def value?
        @is_value
      end

      def to_s
        out = "\n"
        out << "def self.from_gobl!(#{PARAM_NAME})\n"
        if value?
          out << "  new(value: #{PARAM_NAME})\n"
        else
          out << "  #{variable_assigment}\n"
          out << "\n"
          out << "  new(\n    "
          out << property_key_value_strings.join(",\n    ")
          out << "\n"
          out << "  )\n"
        end
        out << 'end'
        out
      end

      private

      attr_reader :schema, :properties

      def property_key_value_strings
        properties.map do |name, prop|
          property_key_value_string(name, prop)
        end
      end

      def property_key_value_string(name, property)
        var = "#{PARAM_NAME}['#{name}']"
        txt = property_value_string(property, var, !schema.required?(name))
        "#{name}: #{txt}"
      end

      def property_value_string(property, var, optional)
        if property.type&.array?
          "#{var}&.map { |item| #{property_value_string(property.items, 'item', false)} }"
        elsif property.ref.present?
          if optional
            "#{var} ? #{property_value_string(property, var, false)} : nil"
          else
            klass = gobl_type_from_reference(property.ref)
            "#{klass}.from_gobl!(#{var})"
          end
        else
          var
        end
      end

      def variable_assigment
        "#{PARAM_NAME} = GOBL::Types::Hash[#{PARAM_NAME}]"
      end
    end
  end
end
