# frozen_string_literal: false

module Generators
  class Ruby
    # Render a `to_gobl` method used to represent an object as hash.
    class ToGoblMethod
      include TypeHelpers

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
        out << "def to_gobl\n"
        if value?
          out << "  #{STRUCT_VALUE_NAME}\n"
        else
          out << "  {\n    "
          out << property_key_value_pairs.join(",\n    ")
          out << "\n  }\n"
        end
        out << "end\n"
        out
      end

      private

      attr_reader :class_name, :properties

      def property_key_value_pairs
        properties.map do |key, property|
          property_key_value_pair(key, property)
        end
      end

      def property_key_value_pair(key, property)
        attr = "attributes[:#{safe_property_name(key)}]"
        "'#{key}' => #{property_value(attr, property)}"
      end

      def property_value(attr, property)
        if property.ref.present?
          "#{attr}&.to_gobl"
        elsif property.type&.array?
          "#{attr}&.map { |item| #{property_value('item', property.items)} }"
        else
          attr
        end
      end
    end
  end
end
