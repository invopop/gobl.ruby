# frozen_string_literal: true

class Generator
  module Renderer
    class Ruby
      # Attributes - Defines the instance attrbutes.
      class Attributes
        def initialize(class_name, properties)
          @class_name = class_name
          @properties = properties
        end

        def to_s
          properties.to_a.map do |name, property|
            att = name.eql?('meta') ? "#{class_name}_#{name}" : name
            %(
              # #{property.description&.split&.join(' ')}
              attribute :#{att}, #{property_as_type(property)}
            )
          end.join("\n")
        end

        private

        attr_reader :class_name, :properties

        def json_schema_type_map
          @json_schema_type_map ||= {
            'string' => 'String',
            'number' => 'Double',
            'integer' => 'Int',
            'boolean' => 'Bool',
            'object' => 'Hash',
            'array' => 'Array',
            'null' => 'Nil'
          }
        end

        def from_json_schema_type(type)
          json_schema_type_map[type] || 'Any'
        end

        def property_as_type(property)
          types_string = property_types_string(property)
          optional_tag = property.optional? ? '.optional' : ''

          if types_string.length > 1
            "(#{types_string.join(' | ')})#{property.null? ? '' : optional_tag}"
          else
            "#{types_string.first}#{optional_tag}"
          end
        end

        def property_types_string(property)
          property.types.map do |type|
            if type.ref?
              type.value.to_s
            elsif type.array?
              "GOBL::Types::Array(#{property_as_type(property.items)})"
            else
              "GOBL::Types::#{from_json_schema_type(type.value)}"
            end
          end
        end
      end
    end
  end
end
