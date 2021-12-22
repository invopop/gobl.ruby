# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class RateTotal < Model::Struct
      attribute :code, Model::Types::String

      attribute :base, GOBL::Num::Amount

      attribute :percent, GOBL::Num::Percentage

      attribute :value, GOBL::Num::Amount

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          code: gobl['code'],
          base: GOBL::Num::Amount.from_gobl!(gobl['base']),
          percent: GOBL::Num::Percentage.from_gobl!(gobl['percent']),
          value: GOBL::Num::Amount.from_gobl!(gobl['value'])
        )
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'base' => attributes[:base]&.to_gobl,
          'percent' => attributes[:percent]&.to_gobl,
          'value' => attributes[:value]&.to_gobl
        }
      end
    end
  end
end
