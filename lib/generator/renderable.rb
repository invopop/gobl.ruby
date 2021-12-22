# frozen_string_literal: true

require_relative '../utils'

class Generator
  # Renderable
  module Renderable
    include Utils

    attr_reader :klass

    def to_text
      raise NotImplementedError
    end

    def attributes?
      !klass.properties_ref.keys.empty?
    end

    def attributes
      attributes? ? klass.properties_ref.keys : ['value']
    end

    private

    attr_reader :exporter

    def properties
      klass.original_json_schema['properties'] || {
        'value' => klass.original_json_schema
      }
    end

    def required_properties
      klass.original_json_schema['required'] || []
    end
  end
end
