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
            #{attributes_string}

            #{from_literal_method}
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
          'array' => 'Array'
        }
      end

      def from_json_schema_type(type)
        json_schema_type_map[type] || 'Any'
      end

      def type_lookup(type, ref)
        if type.nil? && !ref.nil?
          exporter.catalog.fetch_object(strip_definition(ref))
        else
          "Model::Types::#{from_json_schema_type(type)}"
        end
      end

      def attribute_type(props, att, items)
        raw_type = props.dig(att, 'type')
        pfx_type = type_lookup(raw_type, props.dig(att, '$ref'))

        if raw_type.eql?('array')
          sub_type = type_lookup(items['type'], items['$ref'])

          "#{pfx_type}(#{sub_type})"
        else
          pfx_type
        end
      end

      def attributes_string
        attributes.map do |att|
          optional = required_properties.include?(att) ? '' : '.optional'
          type = attribute_type(properties, att, properties.dig(att, 'items'))

          "attribute :#{att}, #{type}#{optional}"
        end.join("\n")
      end

      def from_literal_method
        return unless klass.properties_ref.to_a.empty?

        %(
          def self.from_literal!(literal_value)
            new(#{LITERAL_ATTRIBUTE}: literal_value)
          end
        )
      end
    end
  end
end
