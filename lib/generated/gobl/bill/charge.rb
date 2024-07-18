# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # Charge represents a surchange applied to the complete document independent from the individual lines.
    class Charge < GOBL::Object
      # The Schema ID of the GOBL Charge structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Charge'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] key
      # Key for grouping or identifying charges for tax purposes.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] i
      # Line number inside the list of charges (calculated).
      # @return [Integer]
      property :i, Integer

      # @!attribute [r] ref
      # Code to used to refer to the this charge
      # @return [String]
      property :ref, String

      # @!attribute [r] base
      # Base represents the value used as a base for percent calculations instead of the invoice's sum of lines.
      # @return [GOBL::Num::Amount]
      property :base, GOBL::Num::Amount

      # @!attribute [r] percent
      # Percentage to apply to the Base or Invoice Sum
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] amount
      # Amount to apply (calculated if percent present)
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount

      # @!attribute [r] taxes
      # List of taxes to apply to the charge
      # @return [GOBL::Tax::Set]
      property :taxes, GOBL::Tax::Set

      # @!attribute [r] code
      # Code for why was this charge applied?
      # @return [String]
      property :code, String

      # @!attribute [r] reason
      # Text description as to why the charge was applied
      # @return [String]
      property :reason, String

      # @!attribute [r] meta
      # Additional semi-structured information.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
