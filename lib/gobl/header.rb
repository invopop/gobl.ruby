# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  # Header defines the meta data of the body.
  class Header < GOBL::Struct
    # The Schema ID of the GOBL Header structure
    SCHEMA_ID = 'https://gobl.org/draft-0/envelope#/$defs/Header'

    # @!attribute [r] uuid
    # Unique UUIDv1 identifier for the envelope.
    # @return [GOBL::UUID::UUID]
    attribute :uuid, GOBL::UUID::UUID

    # @!attribute [r] dig
    # Digest of the canonical JSON body.
    # @return [GOBL::DSig::Digest]
    attribute :dig, GOBL::DSig::Digest

    # @!attribute [r] stamps
    # Seals of approval from other organisations.
    # @return [Array<Stamp>]
    attribute? :stamps, GOBL::Types::Array.of(Stamp).optional

    # @!attribute [r] tags
    # Set of labels that describe but have no influence on the data.
    # @return [Array<String>]
    attribute? :tags, GOBL::Types::Array.of(GOBL::Types::String).optional

    # @!attribute [r] meta
    # Additional semi-structured information about this envelope.
    # @return [GOBL::Org::Meta]
    attribute? :meta, GOBL::Org::Meta.optional

    # @!attribute [r] notes
    # Any information that may be relevant to other humans about this envelope
    # @return [String]
    attribute? :notes, GOBL::Types::String.optional

    # @!attribute [r] draft
    # When true, implies that this document should not be considered final. Digital signatures are optional.
    # @return [Boolean]
    attribute? :draft, GOBL::Types::Bool.optional

    # Creates a new object from a hash of GOBL data
    #
    # @param data [Hash] a hash of GOBL data
    #
    # @return [Header] the object created from the given data
    def self.from_gobl!(data)
      data = GOBL::Types::Hash[data]

      new(
        uuid: GOBL::UUID::UUID.from_gobl!(data['uuid']),
        dig: GOBL::DSig::Digest.from_gobl!(data['dig']),
        stamps: data['stamps']&.map { |item| Stamp.from_gobl!(item) },
        tags: data['tags']&.map { |item| item },
        meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil,
        notes: data['notes'],
        draft: data['draft']
      )
    end

    # Returns a hash of GOBL data representing the current object
    #
    # @return [Hash] the array of GOBL data that represents the current object
    def to_gobl
      {
        'uuid' => attributes[:uuid]&.to_gobl,
        'dig' => attributes[:dig]&.to_gobl,
        'stamps' => attributes[:stamps]&.map { |item| item&.to_gobl },
        'tags' => attributes[:tags]&.map { |item| item },
        'meta' => attributes[:meta]&.to_gobl,
        'notes' => attributes[:notes],
        'draft' => attributes[:draft]
      }.compact
    end

    # @!method self.new(attrs)
    #
    #   Returns a {Header} object from a given hash of attributes. Nested
    #   attributes are supported: the constructor will instantiate the proper GOBL
    #   objects when nested hashes or arrays are given as part of the `attrs`
    #   parameter.
    #
    #   @param attrs [Hash] the hash of attributes
    #
    #   @return [Header] the object corresponding to the given input
  end
end

