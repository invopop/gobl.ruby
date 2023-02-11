# frozen_string_literal: true

require_relative "parser"
require_relative "generators/ruby"
require_relative "generators/markdown"

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
      case @lang
      when :ruby
        rb = Generators::Ruby.new(schema)
      when :markdown
        rb = Generators::Markdown.new(schema)
      else
        raise ArgumentError, "Unsupported generator language #{@lang}"
      end
      rb.export_to(path)
    end
  end
end
