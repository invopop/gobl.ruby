# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.36.0
##

module GOBL
  # Envelope wraps around a gobl document and provides support for digest creation and digital signatures.
  class Envelope < GOBL::Object
    # The Schema ID of the GOBL Envelope structure
    SCHEMA_ID = 'https://gobl.org/draft-0/envelope'

    # @!attribute [r] $schema
    # Schema identifies the schema that should be used to understand this document
    # @return [String]
    property :$schema, String
    validates :$schema, presence: true

    # @!attribute [r] head
    # Details on what the contents are
    # @return [Header]
    property :head, Header
    validates :head, presence: true

    # @!attribute [r] doc
    # The data inside the envelope
    # @return [Document]
    property :doc, Document
    validates :doc, presence: true

    # @!attribute [r] sigs
    # JSON Web Signatures of the header
    # @return [Array<GOBL::DSig::Signature>]
    property :sigs, [GOBL::DSig::Signature]
  end
end
