# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # Totals contains the summaries of all calculations for the invoice.
    class Totals < GOBL::Object
      # The Schema ID of the GOBL Totals structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/totals'

      # @!attribute [r] sum
      # Total of all line item amounts.
      # @return [GOBL::Num::Amount]
      property :sum, GOBL::Num::Amount
      validates_presence_of :sum

      # @!attribute [r] discount
      # Total of all discounts applied at the document level.
      # @return [GOBL::Num::Amount]
      property :discount, GOBL::Num::Amount

      # @!attribute [r] charge
      # Total of all charges applied at the document level.
      # @return [GOBL::Num::Amount]
      property :charge, GOBL::Num::Amount

      # @!attribute [r] tax_included
      # Total tax amount included in the prices, if prices are tax-inclusive.
      # @return [GOBL::Num::Amount]
      property :tax_included, GOBL::Num::Amount

      # @!attribute [r] total
      # Net total amount after subtracting discounts and adding charges, excluding tax.
      # @return [GOBL::Num::Amount]
      property :total, GOBL::Num::Amount
      validates_presence_of :total

      # @!attribute [r] taxes
      # Detailed breakdown of all taxes applied to the invoice.
      # @return [GOBL::Tax::Total]
      property :taxes, GOBL::Tax::Total

      # @!attribute [r] tax
      # Total indirect tax amount to be applied to the invoice.
      # @return [GOBL::Num::Amount]
      property :tax, GOBL::Num::Amount

      # @!attribute [r] total_with_tax
      # Final total amount after applying indirect taxes.
      # @return [GOBL::Num::Amount]
      property :total_with_tax, GOBL::Num::Amount
      validates_presence_of :total_with_tax

      # @!attribute [r] retained_tax
      # Total tax amount retained or withheld by the customer to be paid to the tax authority.
      # @return [GOBL::Num::Amount]
      property :retained_tax, GOBL::Num::Amount

      # @!attribute [r] rounding
      # Adjustment amount applied to the invoice totals to meet rounding rules or expectations.
      # @return [GOBL::Num::Amount]
      property :rounding, GOBL::Num::Amount

      # @!attribute [r] payable
      # Final amount to be paid after retained taxes and rounding adjustments.
      # @return [GOBL::Num::Amount]
      property :payable, GOBL::Num::Amount
      validates_presence_of :payable

      # @!attribute [r] advance
      # Total amount already paid in advance by the customer.
      # @return [GOBL::Num::Amount]
      property :advance, GOBL::Num::Amount

      # @!attribute [r] due
      # Remaining amount that needs to be paid.
      # @return [GOBL::Num::Amount]
      property :due, GOBL::Num::Amount
    end
  end
end
