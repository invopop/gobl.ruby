# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  class Payload < Model::Struct
    # Contents of the envelope
    attribute :value, Model::Types::Hash.optional

    def self.from_gobl!(gobl)
      new(
        value: gobl
      )
    end

    def to_gobl
      value
    end
  end
end
