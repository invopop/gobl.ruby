# frozen_string_literal: true

require 'forwardable'

module Dynamic
  # Catalog - This class handles a schema directory and namespacing hierarchy
  # of the objects.
  class Catalog
    extend Forwardable

    def_delegators :@inflector, :inflect, :path_name

    def initialize(path)
      @iterator = Iterator.new(path)
      @inflector = Inflector.new
    end

    def each(&block)
      iterator.each_schema(&block)
    end

    def each_schema
      each { |json_schema| yield Schema.new(json_schema) }
    end

    # Returns a namespace and class name for a given JSON schema definition
    # name, following the original denotation.
    def object_name(original_name)
      names = inflector.camel_case_segments(original_name)

      namespace = names[..-2].reduce(gobl_namespace) do |ns, name|
        if ns.const_defined?(name, false)
          ns.const_get(name, false)
        else
          ns.const_set(name, Module.new)
        end
      end

      [namespace, names[-1]]
    end

    # Returns an object for a given JSON schema definition name.
    def fetch_object(original_name)
      ns, kls = object_name(original_name)

      ns.const_get(kls)
    end

    private

    attr_reader :iterator, :inflector

    def gobl_namespace
      if ::Object.const_defined?(:GOBL)
        ::Object.const_get(:GOBL)
      else
        ::Object.const_set(:GOBL, ::Object::Module.new)
      end
    end
  end
end

require_relative 'catalog/inflector'
require_relative 'catalog/iterator'
require_relative 'catalog/schema'
