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

    ns.const_get(kls) if ns.const_defined?(kls)
  end

  def setup
    gem_loader.setup
    gem_loader.eager_load

    self
  end

  private

  attr_reader :catalog, :gem_loader
end