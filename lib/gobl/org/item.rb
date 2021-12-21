# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

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

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          name: gobl['name'],
          desc: gobl['desc'],
          currency: gobl['currency'],
          price: gobl['price'],
          unit: gobl['unit'],
          supplier_ids: gobl['supplier_ids'],
          origin: gobl['origin'],
          meta: gobl['meta']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
          'name' => attributes[:name],
          'desc' => attributes[:desc],
          'currency' => attributes[:currency],
          'price' => attributes[:price],
          'unit' => attributes[:unit],
          'supplier_ids' => attributes[:supplier_ids],
          'origin' => attributes[:origin],
          'meta' => attributes[:meta]
        }
      end
    end
  end
end
