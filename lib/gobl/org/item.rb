# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Org
    class Item < Dry::Struct
      # Unique identify of this item independent of the Supplier IDs
      attribute :uuid, GOBL::Types::String.optional

      # Primary reference code that identifies this item. Additional codes can be provided in the 'codes' field.
      attribute :ref, GOBL::Types::String.optional

      attribute :name, GOBL::Types::String

      attribute :desc, GOBL::Types::String.optional

      # Only required if this line has a different currency from the rest.
      attribute :currency, GOBL::Types::String.optional

      # Price of item being sold.
      attribute :price, GOBL::Num::Amount

      # Code for unit of the item being sold
      attribute :unit, GOBL::Types::String.optional

      # List of additional codes
      attribute :codes, GOBL::Types::Array(GOBL::Org::ItemCode).optional

      # Country code of where this item was from originally.
      attribute :origin, GOBL::Types::String.optional

      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          ref: gobl['ref'],
          name: gobl['name'],
          desc: gobl['desc'],
          currency: gobl['currency'],
          price: GOBL::Num::Amount.from_gobl!(gobl['price']),
          unit: gobl['unit'],
          codes: gobl['codes']&.map { |x| GOBL::Org::ItemCode.from_gobl!(x) },
          origin: gobl['origin'],
          meta: gobl['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
          'ref' => attributes[:ref],
          'name' => attributes[:name],
          'desc' => attributes[:desc],
          'currency' => attributes[:currency],
          'price' => attributes[:price]&.to_gobl,
          'unit' => attributes[:unit],
          'codes' => attributes[:codes]&.map { |x| x&.to_gobl },
          'origin' => attributes[:origin],
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
