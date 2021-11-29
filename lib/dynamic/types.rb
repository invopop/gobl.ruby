# frozen_string_literal: true

require 'dry-types'

module Dynamic
  # Types defines a global set of types
  module Types
    include Dry.Types()

    Nil    = Strict::Nil
    Int    = Strict::Integer
    Bool   = Strict::Bool
    Hash   = Strict::Hash
    String = Strict::String
    Double = Strict::Float | Strict::Integer

    def self.array?(type)
      type == 'array'
    end

    def self.array_type(items_t, ref_t)
      items_t ? lookup(items_t, ref_t) : Dynamic.fetch_definition(ref_t)
    end

    def self.lookup(type, ref)
      if type.nil? && !ref.nil?
        Dynamic.fetch_definition(ref)
      else
        "Dynamic::Types::#{from_json_schema_type(type)}"
      end
    end

    def self.from_json_schema_type(type) # rubocop:disable Metrics/MethodLength
      case type
      when 'string'
        'String'
      when 'number'
        'Double'
      when 'integer'
        'Int'
      when 'boolean'
        'Bool'
      when 'object'
        'Hash'
      when 'array'
        'Array'
      else
        'Any'
      end
    end
  end
end
