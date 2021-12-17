# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

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
    end
  end
end
