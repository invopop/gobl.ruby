# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Item < Model::Struct
      attribute :uuid, Model::Types::String.optional
      attribute :name, Model::Types::String
      attribute :desc, Model::Types::String.optional
      attribute :currency, Model::Types::String.optional
      attribute :price, Model::Types::String
      attribute :unit, Model::Types::String.optional
      attribute :supplier_ids, Model::Types::Array(GOBL::Org::ItemID).optional
      attribute :origin, Model::Types::String.optional
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
