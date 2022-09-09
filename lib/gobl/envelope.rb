# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  # Envelope wraps around a gobl document and provides support for digest creation and digital signatures.
  class Envelope < GOBL::Struct
    SCHEMA_ID = 'https://gobl.org/draft-0/envelope'

    # @!attribute [r] schema
    # Schema identifies the schema that should be used to understand this document
    # @return [String]
    attribute :schema, GOBL::Types::String

    # @!attribute [r] head
    # Details on what the contents are
    # @return [Header]
    attribute :head, Header

    # @!attribute [r] doc
    # The data inside the envelope
    # @return [Document]
    attribute :doc, Document

    # @!attribute [r] sigs
    # JSON Web Signatures of the header
    # @return [Array<GOBL::DSig::Signature>]
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

    def to_gobl
      {
        '$schema' => attributes[:schema],
        'head' => attributes[:head]&.to_gobl,
        'doc' => attributes[:doc]&.to_gobl,
        'sigs' => attributes[:sigs]&.map { |item| item&.to_gobl }
      }.compact
    end
  end
end

