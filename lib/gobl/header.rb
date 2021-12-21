# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  class Header < Model::Struct
    # Unique UUIDv1 identifier for the envelope.
    attribute :uuid, Model::Types::String

    # Body type of the document contents.
    attribute :typ, Model::Types::String

    # Code for the region the document should be validated with.
    attribute :rgn, Model::Types::String

    # Digest of the canonical JSON body.
    attribute :dig, GOBL::Dsig::Digest

    # Seals of approval from other organisations.
    attribute :stamps, Model::Types::Array(GOBL::Stamp).optional

    # Set of labels that describe but have no influence on the data.
    attribute :tags, Model::Types::Array(Model::Types::String).optional

    # Additional semi-structured information about this envelope.
    attribute :meta, Model::Types::Hash.optional

    # Any information that may be relevant to other humans about this envelope.
    attribute :notes, Model::Types::String.optional

    # When true
    attribute :draft, Model::Types::Bool.optional

    def self.from_gobl!(gobl)
      gobl = Model::Types::Hash[gobl]

      new(
        uuid: gobl['uuid'],
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

    def to_gobl
      {
        'uuid' => attributes[:uuid],
        'typ' => attributes[:typ],
        'rgn' => attributes[:rgn],
        'dig' => attributes[:dig],
        'stamps' => attributes[:stamps],
        'tags' => attributes[:tags],
        'meta' => attributes[:meta],
        'notes' => attributes[:notes],
        'draft' => attributes[:draft]
      }
    end
  end
end
