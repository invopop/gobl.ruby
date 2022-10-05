# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##

module GOBL
  module Pay
    # Advance represents a single payment that has been made already, such as a deposit on an intent to purchase, or as credit from a previous invoice which was later corrected or cancelled.
    class Advance < GOBL::Object
      # The Schema ID of the GOBL Advance structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/advance'

      # @!attribute [r] uuid
      # Unique identifier for this advance.
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] date
      # When the advance was made.
      # @return [GOBL::Cal::Date]
      property :date, GOBL::Cal::Date

      # @!attribute [r] ref
      # ID or reference for the advance.
      # @return [String]
      property :ref, String

      # @!attribute [r] grant
      # If this "advance" payment has come from a public grant or subsidy, set this to true.
      # @return [Boolean]
      property :grant, Boolean

      # @!attribute [r] desc
      # Details about the advance.
      # @return [String]
      property :desc, String
      validates :desc, presence: true

      # @!attribute [r] percent
      # How much as a percentage of the total with tax was paid
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] amount
      # How much was paid.
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount
      validates :amount, presence: true

      # @!attribute [r] currency
      # If different from the parent document's base currency.
      # @return [GOBL::Currency::Code]
      property :currency, GOBL::Currency::Code
    end
  end
end
