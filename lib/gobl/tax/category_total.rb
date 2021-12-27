# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class CategoryTotal < GOBL::Struct
      attribute :code, GOBL::Types::String

      attribute :retained, GOBL::Types::Bool.optional

      attribute :rates, GOBL::Types::Array(GOBL::Tax::RateTotal)

      attribute :base, GOBL::Num::Amount

      attribute :value, GOBL::Num::Amount

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          code: gobl['code'],
          retained: gobl['retained'],
          rates: gobl['rates']&.map { |x| GOBL::Tax::RateTotal.from_gobl!(x) },
          base: GOBL::Num::Amount.from_gobl!(gobl['base']),
          value: GOBL::Num::Amount.from_gobl!(gobl['value'])
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'retained' => attributes[:retained],
          'rates' => attributes[:rates]&.map { |x| x&.to_gobl },
          'base' => attributes[:base]&.to_gobl,
          'value' => attributes[:value]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
