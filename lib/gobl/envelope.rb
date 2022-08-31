# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

require 'dry-struct'

module GOBL
  # Envelope wraps around a gobl document and provides support for digest creation and digital signatures.
  class Envelope < Dry::Struct
    # Schema identifies the schema that should be used to understand this document
    attribute :schema, GOBL::Types::String

    # Details on what the contents are
    attribute :head, Header

    # The data inside the envelope
    attribute :doc, Document

    # JSON Web Signatures of the header
    attribute? :sigs, GOBL::Types::Array.of(GOBL::DSig::Signature).optional

    def self.from_gobl!(data)
      data = GOBL::Types::Hash[data]

      new(
        schema: data['$schema'],
        head: Header.from_gobl!(data['head']),
        doc: Document.from_gobl!(data['doc']),
        sigs: data['sigs']&.map { |item| GOBL::DSig::Signature.from_gobl!(item) }
      )
    end

    def self.from_json!(json)
      from_gobl!(JSON.parse(json))
    end

    def to_gobl
      {
        '$schema' => attributes[:schema],
        'head' => attributes[:head]&.to_gobl,
        'doc' => attributes[:doc]&.to_gobl,
        'sigs' => attributes[:sigs]&.map { |item| item&.to_gobl }
      }
    end

    def to_json(options = nil)
      JSON.generate(to_gobl, options)
    end
  end
end

