# frozen_string_literal: false

module Generators
  class Ruby
    # Render a `from_gobl!` object's class method.
    class ObjectFromGobl
      include TypeHelpers

      PARAM_NAME = 'data'

      def initialize(schema)
        @schema = schema
        @properties = @schema.properties
      end

      def to_s
        <<~EOFS
          def self.from_gobl!(#{PARAM_NAME})
            #{variable_assigment}

            new(
              #{property_key_value_pairs.join(",\n    ")}
            )
          end
        EOFS
      end

      private

      attr_reader :schema, :properties

      def property_key_value_pairs
        properties.map do |name, prop|
          property_key_value_pair(name, prop)
        end
      end

      def property_key_value_pair(name, property)
        var = "#{PARAM_NAME}['#{name}']"
        txt = property_value_string(property, var, schema.optional?(name))
        # explicitely define symbol so we avoid errors with `$schema` or `$id`
        "#{safe_property_name(name)}: #{txt}"
      end

      def property_value_string(property, var, optional)
        if property.type&.array?
          "#{var}&.map { |item| #{property_value_string(property.items, 'item', false)} }"
        elsif property.ref.present?
          if optional
            "#{var} ? #{property_value_string(property, var, false)} : nil"
          else
            c = gobl_custom_ref_map[property.ref.to_s]
            if c.present?
              var
            else
              klass = gobl_type_from_reference(property.ref)
              "#{klass}.from_gobl!(#{var})"
            end
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
