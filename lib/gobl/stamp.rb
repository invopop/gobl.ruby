# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  class Stamp < Model::Struct
    # Identity of the agency used to create the stamp
    attribute :prv, Model::Types::String

    # The serialized stamp value generated for or by the external agency
    attribute :val, Model::Types::String

    def self.from_gobl!(gobl)
      gobl = Model::Types::Hash[gobl]

      new(
        prv: gobl['prv'],
        val: gobl['val']
      )
    end

    def to_gobl
      {
        'prv' => attributes[:prv],
        'val' => attributes[:val]
      }
    end
  end
end
