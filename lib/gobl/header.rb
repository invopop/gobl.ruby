# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  class Header < GOBL::Struct
    # Unique UUIDv1 identifier for the envelope.
    attribute :uuid, GOBL::UUID::UUID

    # Body type of the document contents.
    attribute :typ, GOBL::Types::String

    # Code for the region the document should be validated with.
    attribute :rgn, GOBL::Types::String

    # Digest of the canonical JSON body.
    attribute :dig, GOBL::Dsig::Digest

    # Seals of approval from other organisations.
    attribute :stamps, GOBL::Types::Array(GOBL::Stamp).optional

    # Set of labels that describe but have no influence on the data.
    attribute :tags, GOBL::Types::Array(GOBL::Types::String).optional

    # Additional semi-structured information about this envelope.
    attribute :meta, GOBL::Types::Hash.optional

    # Any information that may be relevant to other humans about this envelope.
    attribute :notes, GOBL::Types::String.optional

    # When true
    attribute :draft, GOBL::Types::Bool.optional

    def self.from_gobl!(gobl)
      gobl = GOBL::Types::Hash[gobl]

      new(
        uuid: GOBL::UUID::UUID.from_gobl!(gobl['uuid']),
        typ: gobl['typ'],
        rgn: gobl['rgn'],
        dig: GOBL::Dsig::Digest.from_gobl!(gobl['dig']),
        stamps: gobl['stamps']&.map { |x| GOBL::Stamp.from_gobl!(x) },
        tags: gobl['tags']&.map { |x| x },
        meta: gobl['meta'],
        notes: gobl['notes'],
        draft: gobl['draft']
      )
    end

    def self.from_json!(json)
      from_gobl!(JSON.parse(json))
    end

    def to_gobl
      {
        'uuid' => attributes[:uuid]&.to_gobl,
        'typ' => attributes[:typ],
        'rgn' => attributes[:rgn],
        'dig' => attributes[:dig]&.to_gobl,
        'stamps' => attributes[:stamps]&.map { |x| x&.to_gobl },
        'tags' => attributes[:tags]&.map { |x| x },
        'meta' => attributes[:meta],
        'notes' => attributes[:notes],
        'draft' => attributes[:draft]
      }
    end

    def to_json(options = nil)
      JSON.generate(to_gobl, options)
    end
  end
end
