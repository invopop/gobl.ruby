# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.36.0
##

module GOBL
  module Pay
    # DueDate contains an amount that should be paid by the given date.
    class DueDate < GOBL::Object
      # The Schema ID of the GOBL DueDate structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/terms#/$defs/DueDate'

      # @!attribute [r] date
      # When the payment is due.
      # @return [GOBL::Cal::Date]
      property :date, GOBL::Cal::Date
      validates :date, presence: true

      # @!attribute [r] notes
      # Other details to take into account for the due date.
      # @return [String]
      property :notes, String

      # @!attribute [r] amount
      # How much needs to be paid by the date.
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount
      validates :amount, presence: true

      # @!attribute [r] percent
      # Percentage of the total that should be paid by the date.
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] currency
      # If different from the parent document's base currency.
      # @return [GOBL::Currency::Code]
      property :currency, GOBL::Currency::Code
    end
  end
end
