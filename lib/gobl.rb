# frozen_string_literal: true

require 'dry-types'
require 'dry-struct'

module GOBL
  # Note namespace
  module Note; end
  # Tax namespace
  module Tax; end
  # Num namespace
  module Num; end
  # Org namespace
  module Org; end
  # Uuid namespace
  module Uuid; end
  # Bill namespace
  module Bill; end
  # Dsig namespace
  module Dsig; end
  # Currency namespace
  module Currency; end
  # I18n namespace
  module I18n; end
  # Pay namespace
  module Pay; end
end

# Global definition of types
module Types
  include Dry.Types()

  Nil    = Strict::Nil
  Int    = Strict::Integer
  Bool   = Strict::Bool
  Hash   = Strict::Hash
  String = Strict::String
  Double = Strict::Float | Strict::Integer
end

package = File.basename(__FILE__, '.rb')
current_dir = __dir__
current_dir_length = current_dir.length + 1

Dir["#{current_dir}/#{package}/**/*.rb"].each do |f|
  require_relative f[current_dir_length..-4]
end

module GOBL
  # Envelope
  class Envelope
    def self.from_json!(json)
      instance = from_dynamic!(JSON.parse(json))

      namespace, class_name = get_object_name(instance.head.typ)
      cls = namespace.const_get(class_name)
      instance.attributes[:doc] = cls.from_dynamic!(instance.doc)

      instance
    end

    def self.get_object_name(original_name, sep = '.')
      names = original_name.split(sep).each { |w| w[0] = w[0].upcase }

      namespace = names[..-2].reduce(::GOBL) do |ns, name|
        if ns.const_defined?(name, false)
          ns.const_get(name, false)
        else
          ns.const_set(name, Module.new)
        end
      end

      [namespace, names[-1]]
    end
  end
end
