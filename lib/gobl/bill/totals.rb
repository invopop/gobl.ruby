# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Totals < Dry::Struct
      # Sum of all line item sums
      attribute :sum, GOBL::Num::Amount

      # Sum of all discounts applied to each line
      attribute :discount, GOBL::Num::Amount

      # Sum of all line sums minus the discounts
      attribute :total, GOBL::Num::Amount

      # Summary of all the taxes with a final sum to add or deduct from the amount payable
      attribute :taxes, GOBL::Tax::Total.optional

      # Total paid in outlays that need to be reimbursed
      attribute :outlays, GOBL::Num::Amount.optional

      # Total amount to be paid after applying taxes
      attribute :payable, GOBL::Num::Amount

      # Total amount paid in advance
      attribute :advance, GOBL::Num::Amount.optional

      # How much actually needs to be paid now
      attribute :due, GOBL::Num::Amount.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          sum: GOBL::Num::Amount.from_gobl!(gobl['sum']),
          discount: GOBL::Num::Amount.from_gobl!(gobl['discount']),
          total: GOBL::Num::Amount.from_gobl!(gobl['total']),
          taxes: gobl['taxes'] ? GOBL::Tax::Total.from_gobl!(gobl['taxes']) : nil,
          outlays: gobl['outlays'] ? GOBL::Num::Amount.from_gobl!(gobl['outlays']) : nil,
          payable: GOBL::Num::Amount.from_gobl!(gobl['payable']),
          advance: gobl['advance'] ? GOBL::Num::Amount.from_gobl!(gobl['advance']) : nil,
          due: gobl['due'] ? GOBL::Num::Amount.from_gobl!(gobl['due']) : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'sum' => attributes[:sum]&.to_gobl,
          'discount' => attributes[:discount]&.to_gobl,
          'total' => attributes[:total]&.to_gobl,
          'taxes' => attributes[:taxes]&.to_gobl,
          'outlays' => attributes[:outlays]&.to_gobl,
          'payable' => attributes[:payable]&.to_gobl,
          'advance' => attributes[:advance]&.to_gobl,
          'due' => attributes[:due]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
