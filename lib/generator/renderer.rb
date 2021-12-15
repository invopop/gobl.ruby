# frozen_string_literal: true

require_relative '../utils'

class Generator
  # Renderer - Abstract class which defines the core behaviour of a specific
  # language renderer.
  class Renderer
    include Utils

    LITERAL_ATTRIBUTE = 'literal'

    attr_reader :klass

    def initialize(klass, exporter)
      @klass = klass
      @exporter = exporter
    end

    def to_text
      raise NotImplementedError
    end

    def self.renderer_map
      @renderer_map ||= {
        'ruby' => Generator::Renderer::Ruby
      }
    end

    def self.for(lang, *args)
      renderer_map[lang]&.new(*args)
    end

    private

    attr_reader :exporter

    def properties
      klass.original_json_schema['properties'] || {}
    end

    def required_properties
      klass.original_json_schema['required'] || []
    end

    def attributes
      props_keys = klass.properties_ref.keys

      props_keys.empty? ? [LITERAL_ATTRIBUTE] : props_keys
    end
  end
end

require_relative 'renderer/ruby'
