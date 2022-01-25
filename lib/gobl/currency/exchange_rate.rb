# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Currency
    class ExchangeRate < Dry::Struct
      # ISO currency code this rate represents.
      attribute :currency, GOBL::Types::String

      # How much is 1.00 of this currency worth in the documents currency.
      attribute :amount, GOBL::Num::Amount

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          currency: gobl['currency'],
          amount: GOBL::Num::Amount.from_gobl!(gobl['amount'])
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'currency' => attributes[:currency],
          'amount' => attributes[:amount]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
