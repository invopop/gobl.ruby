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

      # Rate to apply when converting the document's currency to this one.
      attribute :value, GOBL::Num::Amount

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          currency: gobl['currency'],
          value: GOBL::Num::Amount.from_gobl!(gobl['value'])
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'currency' => attributes[:currency],
          'value' => attributes[:value]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
