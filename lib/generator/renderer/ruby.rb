# frozen_string_literal: true

require_relative 'klass'

class Generator
  module Renderer
    # Ruby - Ruby programming language renderer.
    class Ruby < Generator::Renderer::Klass
      def to_text
        %(
          ##
          ## DO NOT EDIT - This file was generated automatically.
          ##

          require 'dry-struct'

          class #{klass} < #{ancestor_class}
            #{attributes_string.join("\n")}

            #{from_gobl_method}
            #{from_json_method}
            #{to_gobl_method}
            #{to_json_method}
          end
        )
      end

      def self.lang
        'ruby'
      end

      private

      def ancestor_class
        'Dry::Struct'
      end

      def fetch_object(ref)
        return if ref.nil?

        exporter.catalog.fetch_object(ref)
      end

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

      def resolve_references(property)
        property.override do |value|
          fetch_object(strip_definition(value))
        end
      end

      def attributes_string
        attributes.map do |name|
          required = required_properties.include?(name)
          property = Schema::Property.new(properties[name], required: required)

          setup_methods(name, property)
          resolve_references(property)

          %(
            # #{property.description}
            attribute :#{name}, #{property_as_type(property)}
          )
        end
      end

      def setup_methods(name, property)
        from_gobl_method.properties[name] = property
        to_gobl_method.properties[name] = property

        property.ref_klass = fetch_object(klass.properties_ref[name])
      end

      def from_gobl_method
        @from_gobl_method ||= FromGoblMethod.new(is_value: !attributes?)
      end

      def to_gobl_method
        @to_gobl_method ||= ToGoblMethod.new(is_value: !attributes?)
      end

      def from_json_method
        %(
          def self.from_json!(json)
            from_gobl!(JSON.parse(json))
          end
        )
      end

      def to_json_method
        %(
          def to_json(options = nil)
            JSON.generate(to_gobl, options)
          end
        )
      end
    end
  end
end

require_relative 'ruby/from_gobl_method'
require_relative 'ruby/to_gobl_method'
