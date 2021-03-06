# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.28.1
##

require 'dry-struct'

module GOBL
  # Stamp defines an official seal of approval from a third party like a governmental agency or intermediary and should thus be included in any official envelopes.
  class Stamp < Dry::Struct
    # Identity of the agency used to create the stamp
    attribute :prv, GOBL::Types::String

    # The serialized stamp value generated for or by the external agency
    attribute :val, GOBL::Types::String

    def self.from_gobl!(data)
      data = GOBL::Types::Hash[data]

      new(
        prv: data['prv'],
        val: data['val']
      )
    end

    def self.from_json!(json)
      from_gobl!(JSON.parse(json))
    end

    def to_gobl
      {
        'prv' => attributes[:prv],
        'val' => attributes[:val]
      }
    end

    def to_json(options = nil)
      JSON.generate(to_gobl, options)
    end
  end
end

