# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##


module GOBL
  # Envelope wraps around a gobl document and provides support for digest creation and digital signatures.
  class Envelope < GOBL::Struct
    # The Schema ID of the GOBL Envelope structure
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

    # Creates a new object from a hash of GOBL data
    #
    # @param data [Hash] a hash of GOBL data
    #
    # @return [Envelope] the object created from the given data
    def self.from_gobl!(data)
      data = GOBL::Types::Hash[data]

      new(
        schema: data['$schema'],
        head: Header.from_gobl!(data['head']),
        doc: Document.from_gobl!(data['doc']),
        sigs: data['sigs']&.map { |item| GOBL::DSig::Signature.from_gobl!(item) }
      )
    end

    # Returns a hash of GOBL data representing the current object
    #
    # @return [Hash] the array of GOBL data that represents the current object
    def to_gobl
      {
        '$schema' => attributes[:schema],
        'head' => attributes[:head]&.to_gobl,
        'doc' => attributes[:doc]&.to_gobl,
        'sigs' => attributes[:sigs]&.map { |item| item&.to_gobl }
      }.compact
    end

    # @!method self.new(attrs)
    #
    #   Returns a {Envelope} object from a given hash of attributes. Nested
    #   attributes are supported: the constructor will instantiate the proper GOBL
    #   objects when nested hashes or arrays are given as part of the `attrs`
    #   parameter.
    #
    #   @param attrs [Hash] the hash of attributes
    #
    #   @return [Envelope] the object corresponding to the given input
  end
end

