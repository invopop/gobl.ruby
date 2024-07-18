# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Currency
    # An Amount represents a monetary value in a specific currency.
    class Amount < GOBL::Object
      # The Schema ID of the GOBL Amount structure
      SCHEMA_ID = 'https://gobl.org/draft-0/currency/amount'

      # @!attribute [r] label
      # Label allows for additional information to be added to the currency Amount that may be useful.
      # @return [String]
      property :label, String

      # @!attribute [r] currency
      # Code defines the currency for this amount.
      # @return [GOBL::Currency::Code]
      property :currency, GOBL::Currency::Code
      validates_presence_of :currency

      # @!attribute [r] value
      # Value is the amount in the currency.
      # @return [GOBL::Num::Amount]
      property :value, GOBL::Num::Amount
      validates_presence_of :value
    end
  end
end
