# frozen_string_literal: false

module Generators
  class Ruby
    # Render the attribute accessors for the properties of a class.
    class Attributes
      include TypeHelpers

      attr_reader :schema, :properties

      def initialize(schema)
        @schema = schema
        @properties = @schema.properties
        add_value_property
      end

      def indexable_value?
        properties.values.map(&:type).map(&:indexable?).any?
      end

      def to_s
        properties.to_a.map do |name, property|
          out = ''
          desc = property.description&.split&.join(' ')
          out << "# #{desc}\n" if desc.present?
          ts = property_as_type(name, property, !schema.required?(name))
          out << "attribute :#{safe_property_name(name)}, #{ts}\n"
          out
        end.join("\n")
      end

      def present?
        properties.length.positive?
      end

      private

      # If we don't have any properties, we need to fake one as we're probably
      # dealing with a custom hash or something similar.
      def add_value_property
        return if properties.present?

        @properties = { STRUCT_VALUE_NAME => @schema }
      end

      def property_as_type(name, property, optional)
        if optional
          "#{property_as_type(name, property, false)}.optional"
        else
          gobl_type_string(name, property)
        end
      end
    end
  end
end
