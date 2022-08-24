# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Item is used to describe a single product or service.
    class Item < GOBL::Struct
      # Unique identify of this item independent of the Supplier IDs
      attribute :uuid, GOBL::UUID::UUID.optional

      # Primary reference code that identifies this item. Additional codes can be provided in the 'codes' field.
      attribute :ref, GOBL::Types::String.optional

      # Brief name of the item
      attribute :name, GOBL::Types::String

      # Detailed description
      attribute :desc, GOBL::Types::String.optional

      # Currency used for the item's price.
      attribute :currency, GOBL::Types::String.optional

      # Base price of a single unit to be sold.
      attribute :price, GOBL::Types.Constructor(GOBL::Num::Amount)

      # Unit of measure.
      attribute :unit, GOBL::Org::Unit.optional

      # List of additional codes, IDs, or SKUs which can be used to identify the item. The should be agreed upon between supplier and customer.
      attribute :codes, GOBL::Types::Array.of(ItemCode).optional

      # Country code of where this item was from originally.
      attribute :origin, GOBL::L10n::CountryCode.optional

      # Additional meta information that may be useful
      attribute :meta, GOBL::Org::Meta.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          ref: data['ref'],
          name: data['name'],
          desc: data['desc'],
          currency: data['currency'],
          price: data['price'],
          unit: data['unit'] ? GOBL::Org::Unit.from_gobl!(data['unit']) : nil,
          codes: data['codes']&.map { |item| ItemCode.from_gobl!(item) },
          origin: data['origin'] ? GOBL::L10n::CountryCode.from_gobl!(data['origin']) : nil,
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'ref' => attributes[:ref],
          'name' => attributes[:name],
          'desc' => attributes[:desc],
          'currency' => attributes[:currency],
          'price' => attributes[:price]&.to_gobl,
          'unit' => attributes[:unit]&.to_gobl,
          'codes' => attributes[:codes]&.map { |item| item&.to_gobl },
          'origin' => attributes[:origin]&.to_gobl,
          'meta' => attributes[:meta]&.to_gobl
        }
      end
    end
  end
end

