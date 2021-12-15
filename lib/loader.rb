# frozen_string_literal: true

require 'zeitwerk'

require_relative 'catalog'

# Loader - Helper class to load the auto generated and core Ruby structures.
class Loader
  def initialize(schema_dir:, gem_file:, gem_dir:)
    @gem_loader = Zeitwerk::Loader.new
    @gem_loader.tag = File.basename(gem_file, '.rb')
    @gem_loader.inflector = Zeitwerk::GemInflector.new(gem_file)
    @gem_loader.push_dir(gem_dir)

    @catalog = Catalog.new(schema_dir)
  end

  def inflect(inflections)
    catalog.inflect(inflections)
    gem_loader.inflector.inflect(inflections)
  end

  # Returns a Ruby class for a given JSON schema definition name.
  def fetch_object(original_name)
    ns, kls = catalog.object_name(original_name)

    ns.const_get(kls)
  end

  def setup
    gem_loader.setup
    gem_loader.eager_load

    catalog.each_schema do |schema|
      schema.definitions.each do |name, sub_schema|
        patch_class(name, sub_schema, schema.json_schema)
      end
    end

    self
  end

  private

  attr_reader :catalog, :gem_loader

  def patch_class(name, sub_schema, parent_schema)
    namespace, class_name = catalog.object_name(name)
    return unless namespace.const_defined?(class_name, false)

    nc = namespace.const_get(class_name, false)
    nc.init_class(sub_schema)
    nc.expand_references(parent_schema)
    nc.properties_ref.transform_values! { |ref| ref && fetch_object(ref) }
  end
end
