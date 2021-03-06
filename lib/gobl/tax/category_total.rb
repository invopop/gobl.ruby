# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.28.1
##

require 'dry-struct'

module GOBL
  module Tax
    # CategoryTotal groups together all rates inside a given category.
    class CategoryTotal < Dry::Struct
      attribute :code, GOBL::Org::Code

      attribute :retained, GOBL::Types::Bool.optional

      attribute :rates, GOBL::Types::Array.of(RateTotal)

      attribute :base, GOBL::Types.Constructor(GOBL::Num::Amount)

      attribute :amount, GOBL::Types.Constructor(GOBL::Num::Amount)

      attribute :surcharge, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          code: GOBL::Org::Code.from_gobl!(data['code']),
          retained: data['retained'],
          rates: data['rates']&.map { |item| RateTotal.from_gobl!(item) },
          base: data['base'],
          amount: data['amount'],
          surcharge: data['surcharge'] ? data['surcharge'] : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'code' => attributes[:code]&.to_gobl,
          'retained' => attributes[:retained],
          'rates' => attributes[:rates]&.map { |item| item&.to_gobl },
          'base' => attributes[:base]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl,
          'surcharge' => attributes[:surcharge]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

