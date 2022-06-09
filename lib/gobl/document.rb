# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.24.0
##

require 'dry-struct'

module GOBL
  # Contents of the envelope that must contain a $schema.
  class Document < Dry::Struct
    extend Forwardable
    include Enumerable

    attribute :_value, GOBL::Types::Hash

    def_delegators :_value, :[], :each, :empty?, :length, :each_key

    def self.from_gobl!(data)
      new(_value: data)
    end

    def self.from_json!(json)
      from_gobl!(JSON.parse(json))
    end

    def to_gobl
      _value
    end

    def to_json(options = nil)
      JSON.generate(to_gobl, options)
    end
  end
end

