# frozen_string_literal: true

require 'forwardable'

require_relative 'catalog'

# Generator - Helper class to export Ruby structures from a JSON schema.
class Generator
  extend Forwardable

  attr_reader :catalog

  def_delegators :@catalog, :inflect

  def initialize(schema_dir:, lang:)
    @catalog = Catalog.new(schema_dir)
    @lang = lang
  end

  # Going through the schemas, each definition is turned into a class and
  # registered in the exporter object. Finally exporting all the files.
  def export_to(export_path)
    return unless export_path

    catalog.each_schema do |schema|
      schema.definitions.each do |name, sub_schema|
        nc = generate_class(name, sub_schema, schema.json_schema)

        register(name, nc) if nc
      end
    end

    registry.each_value { |renderer| export(renderer, export_path) }
  end

  private

  attr_reader :lang

  def registry
    @registry ||= {}
  end

  def register(name, source_klass)
    registry[name] = Renderer::Klass.for(source_klass, self, lang: lang)
  end

  def lookup(name)
    registry[name]&.source_klass
  end

  def mkdir(dir)
    dir.split('/').inject do |filepath, path|
      Dir.mkdir(filepath) unless File.exist?(filepath)
      [filepath, path].join('/')
    end
  end

  def save_file(renderer, filepath)
    f = File.new(filepath, 'w')
    f.write(renderer.to_text)
    f.close
  end

  def export(renderer, root_dir)
    filepath = renderer.klass_name_segements.map do |segment|
      catalog.path_name(segment)
    end

    dir = filepath.unshift(root_dir).join('/')
    save_file(renderer, "#{mkdir(dir)}.rb")
  end

  # Defines a new class based on the given name and schema, uses the
  # parent schema to expand the references.
  def generate_class(name, sub_schema, parent_schema)
    namespace, class_name = catalog.object_name(name)
    return if namespace.const_defined?(class_name, false)

    nc = Class.new(Generator::Struct) do
      init_class(sub_schema)
      define_props
      expand_references(parent_schema)
    end

    namespace.const_set(class_name, nc)
  end
end

require_relative 'generator/renderer'
require_relative 'generator/struct'
