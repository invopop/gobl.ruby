# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Bill
    class Totals < Model::Struct
      # Sum of all line item sums
      attribute :sum, GOBL::Num::Amount

      # Sum of all discounts applied to each line.
      attribute :discount, GOBL::Num::Amount.optional

      # Sum of all line sums minus the discounts.
      attribute :total, GOBL::Num::Amount.optional

      # Summary of all taxes with a final sum to add or deduct from the amount payable.
      attribute :taxes, GOBL::Tax::Total.optional

      # Total paid in outlays that need to be reimbursed.
      attribute :outlays, GOBL::Num::Amount.optional

      # Total amount to be paid after applying taxes.
      attribute :payable, GOBL::Num::Amount

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          sum: GOBL::Num::Amount.from_gobl!(gobl['sum']),
          discount: gobl['discount'] ? GOBL::Num::Amount.from_gobl!(gobl['discount']) : nil,
          total: gobl['total'] ? GOBL::Num::Amount.from_gobl!(gobl['total']) : nil,
          taxes: gobl['taxes'] ? GOBL::Tax::Total.from_gobl!(gobl['taxes']) : nil,
          outlays: gobl['outlays'] ? GOBL::Num::Amount.from_gobl!(gobl['outlays']) : nil,
          payable: GOBL::Num::Amount.from_gobl!(gobl['payable'])
        )
      end

      def to_gobl
        {
          'sum' => attributes[:sum]&.to_gobl,
          'discount' => attributes[:discount]&.to_gobl,
          'total' => attributes[:total]&.to_gobl,
          'taxes' => attributes[:taxes]&.to_gobl,
          'outlays' => attributes[:outlays]&.to_gobl,
          'payable' => attributes[:payable]&.to_gobl
        }
      end
    end
  end
end
