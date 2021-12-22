# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Bill
    class Totals < Model::Struct
      # Sum of all line item sums
      attribute :sum, Model::Types::String

      # Sum of all discounts applied to each line.
      attribute :discount, Model::Types::String.optional

      # Sum of all line sums minus the discounts.
      attribute :total, Model::Types::String.optional

      # Summary of all taxes with a final sum to add or deduct from the amount payable.
      attribute :taxes, GOBL::Tax::Total.optional

      # Total paid in outlays that need to be reimbursed.
      attribute :outlays, Model::Types::String.optional

      # Total amount to be paid after applying taxes.
      attribute :payable, Model::Types::String

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          sum: gobl['sum'],
          discount: gobl['discount'],
          total: gobl['total'],
          taxes: gobl['taxes'] ? GOBL::Tax::Total.from_gobl!(gobl['taxes']) : nil,
          outlays: gobl['outlays'],
          payable: gobl['payable']
        )
      end

      def to_gobl
        {
          'sum' => attributes[:sum],
          'discount' => attributes[:discount],
          'total' => attributes[:total],
          'taxes' => attributes[:taxes]&.to_gobl,
          'outlays' => attributes[:outlays],
          'payable' => attributes[:payable]
        }
      end
    end
  end
end
