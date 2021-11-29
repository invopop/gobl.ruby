# frozen_string_literal: true

# Dynamic module provides methods to dynamically create and export classes
module Dynamic
  def self.overrides
    @overrides ||= {}
  end

  def self.path_name(raw_name)
    (
      overrides.invert[raw_name] ||
      raw_name.gsub(/(.)([A-Z])/, '\1_\2').downcase
    )
  end

  def self.mkdir(dir)
    dir.split('/').inject do |filepath, path|
      Dir.mkdir(filepath) unless File.exist?(filepath)
      [filepath, path].join('/')
    end
  end

  # Returns the JSON schema definition for a given URI. Stripping the
  # prefix.
  def self.strip_definition(definition)
    %r{#/definitions/(.*)} =~ definition

    Regexp.last_match(1)
  end

  # Dictionary of registered classes.
  def self.kls_map
    @kls_map ||= {}
  end

  def self.lookup(kls)
    kls_map[kls]
  end

  def self.camel_case_segments(text, sep = '.')
    text.split(sep).map do |w|
      overrides[w] || [w[0].upcase, w[1..]].join
    end
  end

  # Returns a Ruby class name and namespace for a given JSON schema
  # definition name.
  def self.object_name(original_name, sep = '.')
    names = camel_case_segments(original_name, sep)

    namespace = names[..-2].reduce(gobl_ns) do |ns, name|
      if ns.const_defined?(name, false)
        ns.const_get(name, false)
      else
        ns.const_set(name, Module.new)
      end
    end

    [namespace, names[-1]]
  end

  # Returns a Ruby class for a given JSON schema definition name.
  def self.fetch_object(original_name, sep = '.')
    ns, kls = object_name(original_name, sep)

    ns.const_get(kls)
  end

  def self.fetch_definition(definition)
    fetch_object(strip_definition(definition))
  end

  # Defines a new class based on the given name and schema, uses the
  # parent schema to expand the references. The class is registered in the
  # subclasses hash.
  def self.register(name, schema, parent_schema)
    namespace, class_name = object_name(name, '.')
    return if namespace.const_defined?(class_name, false)

    nc = Class.new(Dynamic::Base) { init_class(schema) }
    namespace.const_set(class_name, nc)

    kls_map[name] = nc

    nc.define_props
    nc.expand_references(parent_schema)
  end

  def self.amend(name, schema, parent_schema)
    namespace, class_name = object_name(name, '.')
    return unless namespace.const_defined?(class_name, false)

    nc = namespace.const_get(class_name, false)
    nc.init_class(schema)
    nc.replace_props(nc.json_schema, parent_schema)
  end

  def self.export_classes(path: nil)
    return unless path

    kls_map.each_value { |kls| kls.export(path: path) }
  end

  def self.gobl_ns
    if ::Object.const_defined?(:GOBL)
      ::Object.const_get(:GOBL)
    else
      ::Object.const_set(:GOBL, ::Object::Module.new)
    end
  end
end

Dynamic.overrides['gobl'] = 'GOBL'
Dynamic.overrides['uuid'] = 'UUID'
Dynamic.overrides['url'] = 'URL'

require_relative 'dynamic/base'
require_relative 'dynamic/object'
require_relative 'dynamic/types'
