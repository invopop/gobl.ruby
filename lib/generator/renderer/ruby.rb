# frozen_string_literal: true

class Generator
  class Renderer
    # Ruby - Ruby programming language renderer.
    class Ruby < Generator::Renderer
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

      def attribute_type(att)
        types_string = att.types.map { |t| type_to_s(t) }
        optional_tag = att.optional? ? '.optional' : ''

        if types_string.length > 1
          any_null = att.null_type?
          "(#{types_string.join(' | ')})#{any_null ? '' : optional_tag}"
        else
          "#{types_string.first}#{optional_tag}"
        end
      end

      def resolve_references(att)
        att.override_types do |obj|
          kls = exporter.catalog.fetch_object(strip_definition(obj))

          if kls.properties_ref.empty?
            inner_att = Attribute.new('__literal__', kls.original_json_schema)
            attribute_type(inner_att)
          else
            kls
          end
        end
      end

      def attribute_to_s(att)
        "attribute :#{att.name}, #{attribute_type(att)}"
      end

      def type_to_s(type)
        if type.is_name
          if type.array?
            "Model::Types::Array(#{attribute_type(type.items)})"
          else
            "Model::Types::#{from_json_schema_type(type.obj)}"
          end
        else
          type.obj.to_s
        end
      end

      def attributes_string
        attributes.map do |att|
          required = required_properties.include?(att)
          attribute = Attribute.new(att, properties[att], required: required)

          resolve_references(attribute)
          attribute_to_s(attribute)
        end
      end
    end
  end
end

require_relative 'ruby/attribute'
require_relative 'ruby/type'
