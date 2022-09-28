# frozen_string_literal: true

require 'json'
require 'json-schema'
require 'multi_json'

module Parser
  # Loader is responsible for reading a directory of JSON schema and generating a
  # schema object for each JSON Schema file found.
  class Loader
    def initialize(path)
      load_schemas(path)
    end

    # iterate through all the schema defnitions and provide a schema
    # object.
    def each_schema(&block)
      @schemas.each_value(&block)
    end

    def by_id(id)
      @schemas[id]
    end

    protected

    def load_schemas(path)
      @schemas = {}
      Dir["#{path}/**/*.json"].each do |file|
        data = File.read(file)
        schema = Schema.new(MultiJson.load(data))
        puts "loaded schema: #{file}"
        @schemas[schema.id] = schema
      end
    end
  end
end
