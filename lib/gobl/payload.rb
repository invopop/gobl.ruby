# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  class Payload < GOBL::Struct
    # Contents of the envelope
    attribute :value, GOBL::Types::Hash.optional

    def self.from_gobl!(gobl)
      new(
        value: gobl
      )
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
