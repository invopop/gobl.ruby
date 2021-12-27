# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class RateTotal < GOBL::Struct
      attribute :code, GOBL::Types::String

      attribute :base, GOBL::Num::Amount

      attribute :percent, GOBL::Num::Percentage

      attribute :value, GOBL::Num::Amount

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          code: gobl['code'],
          base: GOBL::Num::Amount.from_gobl!(gobl['base']),
          percent: GOBL::Num::Percentage.from_gobl!(gobl['percent']),
          value: GOBL::Num::Amount.from_gobl!(gobl['value'])
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'base' => attributes[:base]&.to_gobl,
          'percent' => attributes[:percent]&.to_gobl,
          'value' => attributes[:value]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
