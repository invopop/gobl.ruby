# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.42.4
##

module GOBL
  # Header defines the metadata of the body.
  class Header < GOBL::Object
    # The Schema ID of the GOBL Header structure
    SCHEMA_ID = 'https://gobl.org/draft-0/envelope#/$defs/Header'

    # @!attribute [r] uuid
    # Unique UUIDv1 identifier for the envelope.
    # @return [GOBL::UUID::UUID]
    property :uuid, GOBL::UUID::UUID
    validates_presence_of :uuid

    # @!attribute [r] dig
    # Digest of the canonical JSON body.
    # @return [GOBL::DSig::Digest]
    property :dig, GOBL::DSig::Digest
    validates_presence_of :dig

    # @!attribute [r] stamps
    # Seals of approval from other organisations.
    # @return [Array<GOBL::CBC::Stamp>]
    property :stamps, [GOBL::CBC::Stamp]

    # @!attribute [r] tags
    # Set of labels that describe but have no influence on the data.
    # @return [Array<String>]
    property :tags, [String]

    # @!attribute [r] meta
    # Additional semi-structured information about this envelope.
    # @return [GOBL::CBC::Meta]
    property :meta, GOBL::CBC::Meta

    # @!attribute [r] notes
    # Any information that may be relevant to other humans about this envelope
    # @return [String]
    property :notes, String

    # @!attribute [r] draft
    # When true, implies that this document should not be considered final. Digital signatures are optional.
    # @return [Boolean]
    property :draft, Boolean
  end
end
