# frozen_string_literal: true

require 'active_support/inflector'

require_relative 'ruby/type_helpers'
require_relative 'ruby/struct'
require_relative 'ruby/attributes'
require_relative 'ruby/from_gobl_method'
require_relative 'ruby/to_gobl_method'

# Define our custom inflections for Ruby conversion here
ActiveSupport::Inflector.inflections do |inflect|
  inflect.acronym 'GOBL'
  inflect.acronym 'UUID'
  inflect.acronym 'URL'
end

module Generators
  # Ruby - Ruby programming language renderer.
  class Ruby
    attr_reader :schema

    def initialize(schema)
      @schema = schema
    end

    def export_to(path)
      path += "/#{schema.id.module}" if schema.id.module.present?
      schema.definitions.each do |name, sub_schema|
        mods = "gobl/#{schema.id.module}".split('/')
        data = Struct.new(mods, name, sub_schema).to_text
        FileUtils.mkdir_p(path)
        dest = "#{path}/#{name.underscore}.rb"
        save_file(dest, data)
      end
    end

    protected

    def save_file(path, data)
      f = File.new(path, 'w')
      f.write(data)
      f.close
      puts "Wrote: #{path}"
    end
  end
end
