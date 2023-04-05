# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.42.0
##

module GOBL
  module Bill
    # Totals contains the summaries of all calculations for the invoice.
    class Totals < GOBL::Object
      # The Schema ID of the GOBL Totals structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Totals'

      # @!attribute [r] sum
      # Sum of all line item sums
      # @return [GOBL::Num::Amount]
      property :sum, GOBL::Num::Amount
      validates_presence_of :sum

      # @!attribute [r] discount
      # Sum of all document level discounts
      # @return [GOBL::Num::Amount]
      property :discount, GOBL::Num::Amount

      # @!attribute [r] charge
      # Sum of all document level charges
      # @return [GOBL::Num::Amount]
      property :charge, GOBL::Num::Amount

      # @!attribute [r] tax_included
      # If prices include tax, this is the total tax included in the price.
      # @return [GOBL::Num::Amount]
      property :tax_included, GOBL::Num::Amount

      # @!attribute [r] total
      # Sum of all line sums minus the discounts, plus the charges, without tax.
      # @return [GOBL::Num::Amount]
      property :total, GOBL::Num::Amount
      validates_presence_of :total

      # @!attribute [r] taxes
      # Summary of all the taxes included in the invoice.
      # @return [GOBL::Tax::Total]
      property :taxes, GOBL::Tax::Total

      # @!attribute [r] tax
      # Total amount of tax to apply to the invoice.
      # @return [GOBL::Num::Amount]
      property :tax, GOBL::Num::Amount

      # @!attribute [r] total_with_tax
      # Grand total after all taxes have been applied.
      # @return [GOBL::Num::Amount]
      property :total_with_tax, GOBL::Num::Amount
      validates_presence_of :total_with_tax

      # @!attribute [r] outlays
      # Total paid in outlays that need to be reimbursed
      # @return [GOBL::Num::Amount]
      property :outlays, GOBL::Num::Amount

      # @!attribute [r] payable
      # Total amount to be paid after applying taxes and outlays.
      # @return [GOBL::Num::Amount]
      property :payable, GOBL::Num::Amount
      validates_presence_of :payable

      # @!attribute [r] advance
      # Total amount already paid in advance.
      # @return [GOBL::Num::Amount]
      property :advance, GOBL::Num::Amount

      # @!attribute [r] due
      # How much actually needs to be paid now.
      # @return [GOBL::Num::Amount]
      property :due, GOBL::Num::Amount
    end
  end
end
