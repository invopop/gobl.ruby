# frozen_string_literal: true

require_relative '../utils'

class Generator
  # Renderable
  module Renderable
    include Utils

    STRUCT_VALUE_NAME = 'value'

    attr_reader :klass

    def to_text
      raise NotImplementedError
    end

    def properties_name?
      !klass.properties_ref.keys.empty?
    end

    def properties_name
      properties_name? ? klass.properties_ref.keys : [STRUCT_VALUE_NAME]
    end

    private

    attr_reader :exporter

    def properties
      klass.original_json_schema['properties'] || {
        STRUCT_VALUE_NAME => klass.original_json_schema
      }
    end

    def required_properties
      klass.original_json_schema['required'] || []
    end
  end
end
