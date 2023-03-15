# frozen_string_literal: true

module Generators
  class Ruby
    # Base generator of a json schema of type object
    class Object < Struct
      include EnumHelpers

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

        if property.enum?
          out << "# Enumeration of possible values for {##{name}} with their corresponding descriptions"
          out << render_enum(property.enum, "#{name.upcase}_ENUM")
        end

        desc = property.description&.split&.join(' ')
        out << "# @!attribute [r] #{name}"
        out << "# #{desc}" if desc.present?
        out << "# @return [#{type_string(property, for_yard: true)}]"
        out << "property :#{name}, #{type_string(property)}"
        out << "validates_presence_of :#{name}" unless schema.optional?(name)
        if property.strict_enum?
          out << [
            "validates_inclusion_of :#{name}",
            "in: #{name.upcase}_ENUM.keys",
            ("allow_blank: true" if schema.optional?(name))
          ].compact.join(', ')
        end
        out.join("\n")
      end
    end
  end
end
