# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Currency
    class ExchangeRate < Model::Struct
      attribute :currency, Model::Types::String

      attribute :value, Model::Types::String

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          currency: gobl['currency'],
          value: gobl['value']
        )
      end

      def to_gobl
        {
          'currency' => attributes[:currency],
          'value' => attributes[:value]
        }
      end
    end
  end
end
