# frozen_string_literal: true

require 'json'
require 'json-schema'

require_relative 'dynamic'

# Generator module to export Ruby structures from a JSON schema
module Generator
  def self.generate(schema_path, lib_path)
    call_forall(:register, schema_path, lib_path)
  end

  def self.enhance(schema_path)
    call_forall(:amend, schema_path)
  end

  def self.call_forall(method, schema_path, lib_path = nil)
    metaschema = JSON::Validator.validator_for_name('draft4').metaschema

    Dir["#{schema_path}/**/*.json"].each do |file|
      schema = JSON::Validator.schema_reader.read(file)

      JSON::Validator.add_schema(schema)
      JSON::Validator.validate!(metaschema, schema.schema)

      reflect_classes(method, schema, lib_path)
    end
  rescue JSON::Schema::ValidationError => e
    puts e.message
  end

  def self.reflect_classes(method, schema, export_path)
    top_definitions = schema.schema['definitions']

    (top_definitions || []).each do |name, props|
      Dynamic.send(method, name, props, schema)
    end

    Dynamic.export_classes(path: export_path) if export_path
  end
end
