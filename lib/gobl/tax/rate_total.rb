# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Tax
    class RateTotal < Dry::Struct
      attribute :code, GOBL::Types::String

      attribute :base, GOBL::Num::Amount

      attribute :percent, GOBL::Num::Percentage

      attribute :amount, GOBL::Num::Amount

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          code: gobl['code'],
          base: GOBL::Num::Amount.from_gobl!(gobl['base']),
          percent: GOBL::Num::Percentage.from_gobl!(gobl['percent']),
          amount: GOBL::Num::Amount.from_gobl!(gobl['amount'])
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
          'amount' => attributes[:amount]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
