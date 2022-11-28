# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.31.0
##

module GOBL
  module Bill
    # LineDiscount represents an amount deducted from the line, and will be applied before taxes.
    class LineDiscount < GOBL::Object
      # The Schema ID of the GOBL LineDiscount structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/LineDiscount'

      # @!attribute [r] percent
      # Percentage if fixed amount not applied
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] amount
      # Fixed discount amount to apply (calculated if percent present).
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount

      # @!attribute [r] code
      # Reason code.
      # @return [String]
      property :code, String

      # @!attribute [r] reason
      # Text description as to why the discount was applied
      # @return [String]
      property :reason, String
    end
  end
end
