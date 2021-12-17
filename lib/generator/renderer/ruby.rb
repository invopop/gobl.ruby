# frozen_string_literal: true

require_relative 'klass'

class Generator
  module Renderer
    # Ruby - Ruby programming language renderer.
    class Ruby < Generator::Renderer::Klass
      def to_text
        %(
          ################################################
          # DO NOT EDIT - Auto generated code            #
          ################################################

          class #{klass} < #{klass.ancestors[1]}
            #{attributes_string.join("\n")}
          end
        )
      end

      def self.lang
        'ruby'
      end

      private

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
            "Model::Types::Array(#{property_as_type(property.items)})"
          else
            "Model::Types::#{from_json_schema_type(type.value)}"
          end
        end
      end

      def resolve_references(property)
        property.override do |value|
          kls = exporter.catalog.fetch_object(strip_definition(value))

          if kls.properties_ref.empty?
            inner_property = Schema::Property.new(kls.original_json_schema)
            property_as_type(inner_property)
          else
            kls
          end
        end
      end

      def attributes_string
        attributes.map do |name|
          required = required_properties.include?(name)
          property = Schema::Property.new(properties[name], required: required)

          resolve_references(property)

          %(
            # #{property.description}
            attribute :#{name}, #{property_as_type(property)}
          )
        end
      end
    end
  end
end
