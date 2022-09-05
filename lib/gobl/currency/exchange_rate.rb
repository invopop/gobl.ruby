# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Currency
    # ExchangeRate contains data on the rate to be used when converting amounts from the document's base currency to whatever is defined.
    class ExchangeRate < GOBL::Struct
      # ISO currency code this rate represents.
      attribute :currency, GOBL::Currency::Code

      # How much is 1.00 of this currency worth in the documents currency.
      attribute :amount, GOBL::Types.Constructor(GOBL::Num::Amount)

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          currency: GOBL::Currency::Code.from_gobl!(data['currency']),
          amount: data['amount']
        )
      end

      def to_gobl
        {
          'currency' => attributes[:currency]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl
        }
      end
    end
  end
end

