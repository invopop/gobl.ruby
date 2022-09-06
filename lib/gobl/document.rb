# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  # Contents of the envelope that must contain a $schema.
  class Document < GOBL::Struct
    SCHEMA_ID = 'https://gobl.org/draft-0/envelope#/$defs/Document'

    extend Forwardable
    include Enumerable

    attribute :_value, GOBL::Types::Hash

    def_delegators :_value, :[], :each, :empty?, :length, :each_key

    def self.from_gobl!(data)
      new(_value: data)
    end

    def to_gobl
      _value
    end
  end
end

