# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Bill
    class Line < Model::Struct
      attribute :uuid, Model::Types::String.optional

      # Line number inside the invoice.
      attribute :i, Model::Types::Int

      attribute :quantity, Model::Types::String

      attribute :item, GOBL::Org::Item

      # Result of quantity multiplied by item price
      attribute :sum, Model::Types::String

      # Discount applied to this line.
      attribute :discount, GOBL::Org::Discount.optional

      # List of taxes to be applied to the line in the invoice totals.
      attribute :taxes, Model::Types::Array(GOBL::Tax::Rate).optional

      # Total line amount after applying discounts to the sum.
      attribute :total, Model::Types::String

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          i: gobl['i'],
          quantity: gobl['quantity'],
          item: GOBL::Org::Item.from_gobl!(gobl['item']),
          sum: gobl['sum'],
          discount: gobl['discount'] ? GOBL::Org::Discount.from_gobl!(gobl['discount']) : nil,
          taxes: gobl['taxes']&.map { |x| GOBL::Tax::Rate.from_gobl!(x) },
          total: gobl['total']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
          'i' => attributes[:i],
          'quantity' => attributes[:quantity],
          'item' => attributes[:item],
          'sum' => attributes[:sum],
          'discount' => attributes[:discount],
          'taxes' => attributes[:taxes],
          'total' => attributes[:total]
        }
      end
    end
  end
end
