# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.50.5
##

module GOBL
  module Bill
    # Discount represents an allowance applied to the complete document independent from the individual lines.
    class Discount < GOBL::Object
      # The Schema ID of the GOBL Discount structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Discount'

      # @!attribute [r] uuid
      # Unique identifying for the discount entry
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] i
      # Line number inside the list of discounts (calculated)
      # @return [Integer]
      property :i, Integer

      # @!attribute [r] ref
      # Reference or ID for this Discount
      # @return [String]
      property :ref, String

      # @!attribute [r] base
      # Base represents the value used as a base for percent calculations. If not already provided, we'll take the invoices sum.
      # @return [GOBL::Num::Amount]
      property :base, GOBL::Num::Amount

      # @!attribute [r] percent
      # Percentage to apply to the invoice's Sum.
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] amount
      # Amount to apply (calculated if percent present).
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount

      # @!attribute [r] taxes
      # List of taxes to apply to the discount
      # @return [GOBL::Tax::Set]
      property :taxes, GOBL::Tax::Set

      # @!attribute [r] code
      # Code for the reason this discount applied
      # @return [String]
      property :code, String

      # @!attribute [r] reason
      # Text description as to why the discount was applied
      # @return [String]
      property :reason, String

      # @!attribute [r] meta
      # Additional semi-structured information.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
