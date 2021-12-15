# frozen_string_literal: true

require_relative 'model'
require_relative 'catalog'

# Generator - Helper class to export Ruby structures from a JSON schema.
class Generator
  def initialize(schema_dir:, lang:)
    @catalog = Catalog.new(schema_dir)
    @exporter = Exporter.new(@catalog, lang)
  end

  def inflect(inflections)
    catalog.inflect(inflections)
  end

  # Going through the schemas, each definition is turned into a class and
  # registered in the exporter object. Finally exporting all the files.
  def export_to(export_path)
    catalog.each_schema do |schema|
      schema.definitions.each do |name, sub_schema|
        nc = generate_class(name, sub_schema, schema.json_schema)

        exporter.register(name, nc) if nc
      end
    end

    exporter.export_all(export_path)
  end

  private

  attr_reader :catalog, :exporter

  # Defines a new class based on the given name and schema, uses the
  # parent schema to expand the references.
  def generate_class(name, sub_schema, parent_schema)
    namespace, class_name = catalog.object_name(name)
    return if namespace.const_defined?(class_name, false)

    nc = Class.new(Model::Struct) do
      init_class(sub_schema)
      define_props
      expand_references(parent_schema)
    end

    namespace.const_set(class_name, nc)
  end
end

require_relative 'generator/exporter'
