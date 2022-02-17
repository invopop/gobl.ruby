# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Line < Dry::Struct
      # Unique identifier for this line
      attribute :uuid, GOBL::Types::String.optional

      # Line number inside the parent
      attribute :i, GOBL::Types::Int

      # Number of items
      attribute :quantity, GOBL::Num::Amount

      # Details about what is being sold
      attribute :item, GOBL::Org::Item

      # Result of quantity multiplied by the item's price
      attribute :sum, GOBL::Num::Amount

      # Discounts applied to this line
      attribute :discounts, GOBL::Types::Array(LineDiscount).optional

      # Charges applied to this line
      attribute :charges, GOBL::Types::Array(LineCharge).optional

      # List of taxes to be applied and used in the invoice totals
      attribute :taxes, GOBL::Types::Array(GOBL::Tax::Rate).optional

      # Total line amount after applying discounts to the sum
      attribute :total, GOBL::Num::Amount

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'],
          i: data['i'],
          quantity: GOBL::Num::Amount.from_gobl!(data['quantity']),
          item: GOBL::Org::Item.from_gobl!(data['item']),
          sum: GOBL::Num::Amount.from_gobl!(data['sum']),
          discounts: data['discounts']&.map { |item| LineDiscount.from_gobl!(item) },
          charges: data['charges']&.map { |item| LineCharge.from_gobl!(item) },
          taxes: data['taxes']&.map { |item| GOBL::Tax::Rate.from_gobl!(item) },
          total: GOBL::Num::Amount.from_gobl!(data['total'])
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
          'i' => attributes[:i],
          'quantity' => attributes[:quantity]&.to_gobl,
          'item' => attributes[:item]&.to_gobl,
          'sum' => attributes[:sum]&.to_gobl,
          'discounts' => attributes[:discounts]&.map { |item| item&.to_gobl },
          'charges' => attributes[:charges]&.map { |item| item&.to_gobl },
          'taxes' => attributes[:taxes]&.map { |item| item&.to_gobl },
          'total' => attributes[:total]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
