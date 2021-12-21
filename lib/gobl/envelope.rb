# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  class Envelope < Model::Struct
    # Details on what the contents are
    attribute :head, GOBL::Header

    # The data being enveloped
    attribute :doc, Model::Types::Hash

    # JSON Web Signatures of the header
    attribute :sigs, Model::Types::Array(Model::Types::String)

    def self.from_gobl!(gobl)
      gobl = Model::Types::Hash[gobl]

      new(
        head: gobl['head'],
        doc: gobl['doc'],
        sigs: gobl['sigs']
      )
    end

    def to_gobl
      {
        'head' => attributes[:head],
        'doc' => attributes[:doc],
        'sigs' => attributes[:sigs]
      }
    end
  end
end
