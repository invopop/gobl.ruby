# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Item < Model::Struct
      # Unique identify of this item independent of the Supplier IDs
      attribute :uuid, Model::Types::String.optional

      attribute :name, Model::Types::String

      attribute :desc, Model::Types::String.optional

      # Only required if this line has a different currency from the rest.
      attribute :currency, Model::Types::String.optional

      # Price of item being sold.
      attribute :price, Model::Types::String

      # Code for unit of the item being sold
      attribute :unit, Model::Types::String.optional

      attribute :supplier_ids, Model::Types::Array(GOBL::Org::ItemID).optional

      # Country code of where this item was from originally.
      attribute :origin, Model::Types::String.optional

      attribute :meta, Model::Types::Hash.optional
    end
  end
end
