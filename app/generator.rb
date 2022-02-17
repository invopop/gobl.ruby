# frozen_string_literal: true

require_relative 'parser'
require_relative 'generators/ruby'

# Generator - Helper class to export Ruby structures from a JSON schema.
class Generator
  attr_reader :parser

  def initialize(path:, lang:)
    @parser = Parser.load(path)
    @lang = lang
  end

  # Going through the schemas, each definition is turned into a class and
  # registered in the exporter object. Finally exporting all the files.
  def export_to(path)
    return unless path

    @parser.each_schema do |schema|
      # TODO: Support language selection here
      rb = Generators::Ruby.new(schema)
      rb.export_to(path)
    end
  end
end
