# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  class Header < Dynamic::Struct
    attribute :uuid, GOBL::UUID::UUID
    attribute :typ, Dynamic::Types::String
    attribute :rgn, Dynamic::Types::String
    attribute :dig, GOBL::Dsig::Digest
    attribute :stamps, Dynamic::Types::Array(GOBL::Stamp).optional
    attribute :tags, Dynamic::Types::Array(Dynamic::Types::String).optional
    attribute :meta, Dynamic::Types::Hash.optional
    attribute :notes, Dynamic::Types::String.optional
    attribute :draft, Dynamic::Types::Bool.optional

    def self.properties_ref
      @properties_ref ||= {
        'uuid' => GOBL::UUID::UUID,
        'typ' => nil,
        'rgn' => nil,
        'dig' => GOBL::Dsig::Digest,
        'stamps' => GOBL::Stamp,
        'tags' => nil,
        'meta' => nil,
        'notes' => nil,
        'draft' => nil
      }
    end
  end
end
