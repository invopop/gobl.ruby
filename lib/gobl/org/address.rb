# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Address < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :label, Model::Types::String.optional
      attribute :po_box, Model::Types::String.optional
      attribute :num, Model::Types::String.optional
      attribute :floor, Model::Types::String.optional
      attribute :block, Model::Types::String.optional
      attribute :door, Model::Types::String.optional
      attribute :street, Model::Types::String.optional
      attribute :street_extra, Model::Types::String.optional
      attribute :locality, Model::Types::String
      attribute :region, Model::Types::String
      attribute :code, Model::Types::String.optional
      attribute :country, Model::Types::String.optional
      attribute :coords, GOBL::Org::Coordinates.optional
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
