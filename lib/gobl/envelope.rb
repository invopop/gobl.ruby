# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  class Envelope < Dry::Struct
    # The GOBL document version used to generate the envelope
    attribute :ver, GOBL::Types::String

    # Details on what the contents are
    attribute :head, GOBL::Header

    # The data inside the envelope
    attribute :doc, GOBL::Payload

    # JSON Web Signatures of the header
    attribute :sigs, GOBL::Types::Array(GOBL::Dsig::Signature)

    def self.from_gobl!(gobl)
      gobl = GOBL::Types::Hash[gobl]

      new(
        ver: gobl['ver'],
        head: GOBL::Header.from_gobl!(gobl['head']),
        doc: GOBL::Payload.from_gobl!(gobl['doc']),
        sigs: gobl['sigs']&.map { |x| GOBL::Dsig::Signature.from_gobl!(x) }
      )
    end

    def self.from_json!(json)
      from_gobl!(JSON.parse(json))
    end

    def to_gobl
      {
        'ver' => attributes[:ver],
        'head' => attributes[:head]&.to_gobl,
        'doc' => attributes[:doc]&.to_gobl,
        'sigs' => attributes[:sigs]&.map { |x| x&.to_gobl }
      }
    end

    def to_json(options = nil)
      JSON.generate(to_gobl, options)
    end
  end
end
