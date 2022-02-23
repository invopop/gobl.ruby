# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  class Document < Dry::Struct
    # Contents of the envelope
    attribute :value, GOBL::Types::Hash.optional

    def self.from_gobl!(data)
      new(value: data)
    end

    def self.from_json!(json)
      from_gobl!(JSON.parse(json))
    end

    def to_gobl
      value
    end

    def to_json(options = nil)
      JSON.generate(to_gobl, options)
    end
  end
end
