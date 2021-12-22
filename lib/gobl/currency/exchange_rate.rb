# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Currency
    class ExchangeRate < Model::Struct
      attribute :currency, Model::Types::String

      attribute :value, GOBL::Num::Amount

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          currency: gobl['currency'],
          value: GOBL::Num::Amount.from_gobl!(gobl['value'])
        )
      end

      def to_gobl
        {
          'currency' => attributes[:currency],
          'value' => attributes[:value]&.to_gobl
        }
      end
    end
  end
end
