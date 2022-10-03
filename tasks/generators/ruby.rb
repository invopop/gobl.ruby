# frozen_string_literal: true

require 'active_support/inflector'

require_relative 'ruby/type_helpers'
require_relative 'ruby/base'
require_relative 'ruby/struct'
require_relative 'ruby/single_value'
require_relative 'ruby/array'
require_relative 'ruby/map'
require_relative 'ruby/object_from_gobl'
require_relative 'ruby/object_to_gobl'
require_relative 'ruby/object'
require_relative 'ruby/string'
require_relative 'ruby/any'

# Define our custom inflections for Ruby conversion here
ActiveSupport::Inflector.inflections do |inflect|
  inflect.acronym 'GOBL'
  inflect.acronym 'UUID'
  inflect.acronym 'URL'
  inflect.acronym 'DSig'
  inflect.acronym 'ID' # Go always uses ID
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
        data = schema_to_ruby(mods, name, sub_schema, schema).to_s
        FileUtils.mkdir_p(path)
        dest = "#{path}/#{name.underscore}.rb"
        save_file(dest, data)
      end
    rescue SkipFileError
      puts "Skipping #{schema.id}"
    end

    protected

    def schema_to_ruby(mods, name, schema, parent)
      if schema.type.nil?
        Any.new(mods, name, schema, parent)
      elsif schema.type.object?
        if schema.properties.empty?
          Map.new(mods, name, schema, parent)
        else
          Object.new(mods, name, schema, parent)
        end
      elsif schema.type.array?
        Array.new(mods, name, schema, parent)
      elsif schema.type.string?
        String.new(mods, name, schema, parent)
      else
        raise 'undefined json schema type'
      end
    end

    def save_file(path, data)
      f = File.new(path, 'w')
      f.write(data)
      f.close
      puts "Wrote: #{path}"
    end
  end
end
