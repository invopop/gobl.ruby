# frozen_string_literal: true

require 'json'
require 'json-schema'

module Dynamic
  class Catalog
    # Iterator - Object thats goes through the validated JSON schema files in a
    # directory.
    class Iterator
      def initialize(path)
        @source_path = path
      end

      def each_schema
        metaschema = JSON::Validator.validator_for_name('draft4').metaschema

        Dir["#{source_path}/**/*.json"].each do |file|
          schema = JSON::Validator.schema_reader.read(file)

          JSON::Validator.add_schema(schema)
          JSON::Validator.validate!(metaschema, schema.schema)

          yield schema
        end
      rescue JSON::Schema::ValidationError => e
        puts e.message
      end

      private

      attr_reader :source_path
    end
  end
end
