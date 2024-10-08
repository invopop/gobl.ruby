# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Head
    # Header defines the metadata of the body.
    class Header < GOBL::Object
      # The Schema ID of the GOBL Header structure
      SCHEMA_ID = 'https://gobl.org/draft-0/head/header'

      # @!attribute [r] uuid
      # Unique UUIDv1 identifier for the envelope.
      # @return [String]
      property :uuid, String
      validates_presence_of :uuid

      # @!attribute [r] dig
      # Digest of the canonical JSON body.
      # @return [GOBL::DSig::Digest]
      property :dig, GOBL::DSig::Digest
      validates_presence_of :dig

      # @!attribute [r] stamps
      # Seals of approval from other organisations that can only be added to non-draft envelopes.
      # @return [Array<GOBL::Head::Stamp>]
      property :stamps, [GOBL::Head::Stamp]

      # @!attribute [r] links
      # Links provide URLs to other resources that are related to this envelope and unlike stamps can be added even in the draft state.
      # @return [Array<GOBL::Head::Link>]
      property :links, [GOBL::Head::Link]

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
    end
  end
end
