# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

require 'dry-struct'

module GOBL
  # Header defines the meta data of the body.
  class Header < Dry::Struct
    # Unique UUIDv1 identifier for the envelope.
    attribute :uuid, GOBL::UUID::UUID

    # Digest of the canonical JSON body.
    attribute :dig, GOBL::DSig::Digest

    # Seals of approval from other organisations.
    attribute :stamps, GOBL::Types::Array.of(Stamp).optional

    # Set of labels that describe but have no influence on the data.
    attribute :tags, GOBL::Types::Array.of(GOBL::Types::String).optional

    # Additional semi-structured information about this envelope.
    attribute :meta, GOBL::Org::Meta.optional

    # Any information that may be relevant to other humans about this envelope
    attribute :notes, GOBL::Types::String.optional

    # When true, implies that this document should not be considered final. Digital signatures are optional.
    attribute :draft, GOBL::Types::Bool.optional

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

    def self.from_json!(json)
      from_gobl!(JSON.parse(json))
    end

    def to_gobl
      {
        'uuid' => attributes[:uuid]&.to_gobl,
        'dig' => attributes[:dig]&.to_gobl,
        'stamps' => attributes[:stamps]&.map { |item| item&.to_gobl },
        'tags' => attributes[:tags]&.map { |item| item },
        'meta' => attributes[:meta]&.to_gobl,
        'notes' => attributes[:notes],
        'draft' => attributes[:draft]
      }
    end

    def to_json(options = nil)
      JSON.generate(to_gobl, options)
    end
  end
end

