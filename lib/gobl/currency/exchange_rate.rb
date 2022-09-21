# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.3
##


module GOBL
  module Currency
    # ExchangeRate contains data on the rate to be used when converting amounts from the document's base currency to whatever is defined.
    class ExchangeRate < GOBL::Struct
      # The Schema ID of the GOBL ExchangeRate structure
      SCHEMA_ID = 'https://gobl.org/draft-0/currency/exchange-rate'

      # @!attribute [r] currency
      # ISO currency code this rate represents.
      # @return [GOBL::Currency::Code]
      attribute :currency, GOBL::Currency::Code

      # @!attribute [r] amount
      # How much is 1.00 of this currency worth in the documents currency.
      # @return [GOBL::Num::Amount]
      attribute :amount, GOBL::Types.Constructor(GOBL::Num::Amount)

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [ExchangeRate] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          currency: GOBL::Currency::Code.from_gobl!(data['currency']),
          amount: data['amount']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'currency' => attributes[:currency]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {ExchangeRate} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [ExchangeRate] the object corresponding to the given input
    end
  end
end

