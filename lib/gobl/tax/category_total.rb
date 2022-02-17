# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Tax
    class CategoryTotal < Dry::Struct
      attribute :code, GOBL::Types::String

      attribute :retained, GOBL::Types::Bool.optional

      attribute :rates, GOBL::Types::Array(RateTotal)

      attribute :base, GOBL::Num::Amount

      attribute :amount, GOBL::Num::Amount

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          code: data['code'],
          retained: data['retained'],
          rates: data['rates']&.map { |item| RateTotal.from_gobl!(item) },
          base: GOBL::Num::Amount.from_gobl!(data['base']),
          amount: GOBL::Num::Amount.from_gobl!(data['amount'])
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'retained' => attributes[:retained],
          'rates' => attributes[:rates]&.map { |item| item&.to_gobl },
          'base' => attributes[:base]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
