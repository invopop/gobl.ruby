# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.38.0
##

module GOBL
  module Currency
    # ExchangeRate contains data on the rate to be used when converting amounts from the document's base currency to whatever is defined.
    class ExchangeRate < GOBL::Object
      # The Schema ID of the GOBL ExchangeRate structure
      SCHEMA_ID = 'https://gobl.org/draft-0/currency/exchange-rate'

      # @!attribute [r] currency
      # ISO currency code this rate represents.
      # @return [GOBL::Currency::Code]
      property :currency, GOBL::Currency::Code
      validates :currency, presence: true

      # @!attribute [r] amount
      # How much is 1.00 of this currency worth in the documents currency.
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount
      validates :amount, presence: true
    end
  end
end
