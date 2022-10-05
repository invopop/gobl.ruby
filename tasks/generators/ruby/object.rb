# frozen_string_literal: true

module Generators
  class Ruby
    # Base generator of a json schema of type object
    class Object < Struct
      protected

      def parent_class
        'GOBL::Object'
      end

      def additional_content
        attributes
      end

      def attributes
        schema.properties.map do |name, property|
          attribute(name, property)
        end.join("\n\n")
      end

      def attribute(name, property)
        out = []
        desc = property.description&.split&.join(' ')
        out << "# @!attribute [r] #{name}"
        out << "# #{desc}" if desc.present?
        out << "# @return [#{type_string(property, for_yard: true)}]"
        out << "property :#{name}, #{type_string(property)}"
        out << "validates :#{name}, presence: true" unless schema.optional?(name)
        out.join("\n")
      end
    end
  end
end
