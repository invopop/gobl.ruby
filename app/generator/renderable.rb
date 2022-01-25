# frozen_string_literal: true

require_relative '../utils'

class Generator
  # Renderable
  module Renderable
    include Utils

    STRUCT_VALUE_NAME = 'value'

    attr_reader :source_klass

    def to_text
      raise NotImplementedError
    end

    def properties_name?
      !source_klass.properties_ref.keys.empty?
    end

    def properties_name
      properties_name? ? source_klass.properties_ref.keys : [STRUCT_VALUE_NAME]
    end

    private

    attr_reader :generator

    def properties
      source_klass.original_json_schema['properties'] || {
        STRUCT_VALUE_NAME => source_klass.original_json_schema
      }
    end

    def required_properties
      source_klass.original_json_schema['required'] || []
    end
  end
end
