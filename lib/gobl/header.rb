# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  class Header < Model::Struct
    attribute :uuid, Model::Types::String
    attribute :typ, Model::Types::String
    attribute :rgn, Model::Types::String
    attribute :dig, GOBL::Dsig::Digest
    attribute :stamps, Model::Types::Array(GOBL::Stamp).optional
    attribute :tags, Model::Types::Array(Model::Types::String).optional
    attribute :meta, Model::Types::Hash.optional
    attribute :notes, Model::Types::String.optional
    attribute :draft, Model::Types::Bool.optional
  end
end
