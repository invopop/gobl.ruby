# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.50.5
##

module GOBL
  # Envelope wraps around a document adding headers and digital signatures.
  class Envelope < GOBL::Object
    # The Schema ID of the GOBL Envelope structure
    SCHEMA_ID = 'https://gobl.org/draft-0/envelope'

    # @!attribute [r] $schema
    # Schema identifies the schema that should be used to understand this document
    # @return [String]
    property :$schema, String
    validates_presence_of :$schema

    # @!attribute [r] head
    # Details on what the contents are
    # @return [Header]
    property :head, Header
    validates_presence_of :head

    # @!attribute [r] doc
    # The data inside the envelope
    # @return [Document]
    property :doc, Document
    validates_presence_of :doc

    # @!attribute [r] sigs
    # JSON Web Signatures of the header
    # @return [Array<GOBL::DSig::Signature>]
    property :sigs, [GOBL::DSig::Signature]
  end
end
