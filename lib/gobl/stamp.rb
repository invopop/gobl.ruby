# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  class Stamp < Dry::Struct
    # Identity of the agency used to create the stamp
    attribute :prv, GOBL::Types::String

    # The serialized stamp value generated for or by the external agency
    attribute :val, GOBL::Types::String

    def self.from_gobl!(gobl)
      gobl = GOBL::Types::Hash[gobl]

      new(
        prv: gobl['prv'],
        val: gobl['val']
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
