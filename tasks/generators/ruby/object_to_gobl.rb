# frozen_string_literal: false

module Generators
  class Ruby
    # Render a `to_gobl` method used to represent an object as hash.
    class ObjectToGobl
      include TypeHelpers

      def initialize(schema)
        @schema = schema
        @properties = @schema.properties
      end

      def to_s
        <<~EOFS
          # Returns a hash of GOBL data representing the current object
          #
          # @return [Hash] the array of GOBL data that represents the current object
          def to_gobl
            {
              #{property_key_value_pairs.join(",\n    ")}
            }.compact
          end
        EOFS
      end

      private

      attr_reader :properties

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
