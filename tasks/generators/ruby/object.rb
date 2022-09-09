module Generators
  class Ruby
    # Base generator of a json schema of type object
    class Object < Struct
      protected

      def attributes
        schema.properties.to_a.map do |name, property|
          attribute(name, property)
        end.join("\n")
      end

      def from_gobl_method
        @from_gobl_method ||= ObjectFromGobl.new(schema).to_s
      end

      def to_gobl_method
        @to_gobl_method ||= ObjectToGobl.new(schema).to_s
      end

      def attribute(name, property)
        out = ''
        desc = property.description&.split&.join(' ')
        ts = property_as_type(name, property, schema.optional?(name))
        out << "# @!attribute [r] #{safe_property_name(name)}\n"
        out << "# #{desc}\n" if desc.present?
        out << "# @return [#{ruby_type_string(property)}]\n"
        out << "attribute#{'?' if schema.optional?(name)} :#{safe_property_name(name)}, #{ts}\n"
        out
      end

      def property_as_type(name, property, optional)
        if optional
          "#{property_as_type(name, property, false)}.optional"
        else
          gobl_type_string(property)
        end
      end
    end
  end
end
