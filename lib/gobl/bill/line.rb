# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Bill
    class Line < GOBL::Struct
      attribute :uuid, GOBL::Types::String.optional

      # Line number inside the invoice.
      attribute :i, GOBL::Types::Int

      attribute :quantity, GOBL::Num::Amount

      attribute :item, GOBL::Org::Item

      # Result of quantity multiplied by item price
      attribute :sum, GOBL::Num::Amount

      # Discount applied to this line.
      attribute :discount, GOBL::Org::Discount.optional

      # List of taxes to be applied to the line in the invoice totals.
      attribute :taxes, GOBL::Types::Array(GOBL::Tax::Rate).optional

      # Total line amount after applying discounts to the sum.
      attribute :total, GOBL::Num::Amount

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          i: gobl['i'],
          quantity: GOBL::Num::Amount.from_gobl!(gobl['quantity']),
          item: GOBL::Org::Item.from_gobl!(gobl['item']),
          sum: GOBL::Num::Amount.from_gobl!(gobl['sum']),
          discount: gobl['discount'] ? GOBL::Org::Discount.from_gobl!(gobl['discount']) : nil,
          taxes: gobl['taxes']&.map { |x| GOBL::Tax::Rate.from_gobl!(x) },
          total: GOBL::Num::Amount.from_gobl!(gobl['total'])
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
          'discount' => attributes[:discount]&.to_gobl,
          'taxes' => attributes[:taxes]&.map { |x| x&.to_gobl },
          'total' => attributes[:total]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
