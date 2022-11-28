# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.31.0
##

module GOBL
  module Bill
    # LineCharge represents an amount added to the line, and will be applied before taxes.
    class LineCharge < GOBL::Object
      # The Schema ID of the GOBL LineCharge structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/LineCharge'

      # @!attribute [r] percent
      # Percentage if fixed amount not applied
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] amount
      # Fixed or resulting charge amount to apply (calculated if percent present).
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount

      # @!attribute [r] code
      # Reference code.
      # @return [String]
      property :code, String

      # @!attribute [r] reason
      # Text description as to why the charge was applied
      # @return [String]
      property :reason, String
    end
  end
end
