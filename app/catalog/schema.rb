# frozen_string_literal: true

class Catalog
  # Schema - JSON schema object wrapper
  class Schema
    attr_reader :json_schema

    def initialize(schema)
      @json_schema = schema
    end

    def definitions
      json_schema.schema['definitions'] || []
    end
  end
end
