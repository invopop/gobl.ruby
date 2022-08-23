# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

require 'dry-struct'

module GOBL
  module Bill
    # Line is a single row in an invoice.
    class Line < Dry::Struct
      # Unique identifier for this line
      attribute :uuid, GOBL::UUID::UUID.optional

      # Line number inside the parent (calculated)
      attribute :i, GOBL::Types::Int

      # Number of items
      attribute :quantity, GOBL::Types.Constructor(GOBL::Num::Amount)

      # Details about what is being sold
      attribute :item, GOBL::Org::Item

      # Result of quantity multiplied by the item's price (calculated)
      attribute :sum, GOBL::Types.Constructor(GOBL::Num::Amount)

      # Discounts applied to this line
      attribute :discounts, GOBL::Types::Array.of(LineDiscount).optional

      # Charges applied to this line
      attribute :charges, GOBL::Types::Array.of(LineCharge).optional

      # Map of taxes to be applied and used in the invoice totals
      attribute :taxes, GOBL::Tax::Set.optional

      # Total line amount after applying discounts to the sum (calculated).
      attribute :total, GOBL::Types.Constructor(GOBL::Num::Amount)

      # Set of specific notes for this line that may be required for clarification.
      attribute :notes, GOBL::Org::Notes.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          i: data['i'],
          quantity: data['quantity'],
          item: GOBL::Org::Item.from_gobl!(data['item']),
          sum: data['sum'],
          discounts: data['discounts']&.map { |item| LineDiscount.from_gobl!(item) },
          charges: data['charges']&.map { |item| LineCharge.from_gobl!(item) },
          taxes: data['taxes'] ? GOBL::Tax::Set.from_gobl!(data['taxes']) : nil,
          total: data['total'],
          notes: data['notes'] ? GOBL::Org::Notes.from_gobl!(data['notes']) : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'i' => attributes[:i],
          'quantity' => attributes[:quantity]&.to_gobl,
          'item' => attributes[:item]&.to_gobl,
          'sum' => attributes[:sum]&.to_gobl,
          'discounts' => attributes[:discounts]&.map { |item| item&.to_gobl },
          'charges' => attributes[:charges]&.map { |item| item&.to_gobl },
          'taxes' => attributes[:taxes]&.to_gobl,
          'total' => attributes[:total]&.to_gobl,
          'notes' => attributes[:notes]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

