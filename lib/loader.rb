# frozen_string_literal: true

require 'zeitwerk'

require_relative 'catalog'

# Loader - Helper class to load the auto generated and core Ruby structures.
class Loader
  def initialize(gem_file:, gem_dir:)
    @gem_loader = Zeitwerk::Loader.new
    @gem_loader.tag = File.basename(gem_file, '.rb')
    @gem_loader.inflector = Zeitwerk::GemInflector.new(gem_file)
    @gem_loader.push_dir(gem_dir)
  end

  def inflect(inflections)
    gem_loader.inflector.inflect(inflections)
  end

  def setup
    gem_loader.setup
    gem_loader.eager_load

    self
  end

  private

  attr_reader :gem_loader
end
