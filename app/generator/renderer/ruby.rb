# frozen_string_literal: true

require_relative 'klass'

class Generator
  module Renderer
    # Ruby - Ruby programming language renderer.
    class Ruby < Generator::Renderer::Klass
      def to_text
        setup
        klass_as_text
      end

      def self.lang
        'ruby'
      end

      private

      def klass_as_text
        %(
          ##
          ## DO NOT EDIT - This file was generated automatically.
          ##

          #{properties_name? ? '' : "require 'forwardable'"}

          require 'dry-struct'

          class #{klass} < #{ancestor_class}
            #{properties_name? ? '' : forwardable_methods}

            #{attributes}

            #{from_gobl_method}
            #{from_json_method}
            #{to_gobl_method}
            #{to_json_method}
          end
        )
      end

      def ancestor_class
        'Dry::Struct'
      end

      def fetch_object(ref)
        return if ref.nil?

        exporter.catalog.fetch_object(ref)
      end

      def resolve_references(property)
        property.override do |value|
          fetch_object(strip_definition(value))
        end
      end

      def setup
        properties_name.each do |name|
          required = required_properties.include?(name)
          property = Schema::Property.new(properties[name], required: required)
          property.ref_klass = fetch_object(klass.properties_ref[name])

          resolve_references(property)

          properties_map[name] = property
        end
      end

      def properties_map
        @properties_map ||= {}
      end

      def name
        @name ||= klass.to_s.split('::').last.downcase
      end

      def attributes
        @attributes ||= Attributes.new(name, properties_map)
      end

      def from_gobl_method
        @from_gobl_method ||= FromGoblMethod.new(name, properties_map, is_value: !properties_name?)
      end

      def to_gobl_method
        @to_gobl_method ||= ToGoblMethod.new(name, properties_map, is_value: !properties_name?)
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

      def forwardable_methods
        %(
          extend Forwardable

          def_delegators :value, :to_s
          #{attributes.indexable_value? ? 'def_delegators :value, :[]' : ''}
        )
      end
    end
  end
end

require_relative 'ruby/attributes'
require_relative 'ruby/from_gobl_method'
require_relative 'ruby/to_gobl_method'
