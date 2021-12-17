# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

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
  end
end
