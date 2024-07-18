# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Currency
    # ExchangeRate contains data on the rate to be used when converting amounts from one currency into another.
    class ExchangeRate < GOBL::Object
      # The Schema ID of the GOBL ExchangeRate structure
      SCHEMA_ID = 'https://gobl.org/draft-0/currency/exchange-rate'

      # @!attribute [r] from
      # Currency code this will be converted from.
      # @return [GOBL::Currency::Code]
      property :from, GOBL::Currency::Code
      validates_presence_of :from

      # @!attribute [r] to
      # Currency code this exchange rate will convert into.
      # @return [GOBL::Currency::Code]
      property :to, GOBL::Currency::Code
      validates_presence_of :to

      # @!attribute [r] amount
      # How much is 1 of the "from" currency worth in the "to" currency.
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount
      validates_presence_of :amount

      # @!attribute [r] at
      # At represents the date and time (which may be 00:00:00) when the currency rate amount was determined.
      # @return [GOBL::Cal::DateTime]
      property :at, GOBL::Cal::DateTime
    end
  end
end
