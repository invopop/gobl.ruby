# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

require 'dry-struct'

module GOBL
  module Currency
    # ExchangeRate contains data on the rate to be used when converting amounts from the document's base currency to whatever is defined.
    class ExchangeRate < Dry::Struct
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

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'currency' => attributes[:currency]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

