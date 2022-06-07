# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.23.0
##

require 'dry-struct'

module GOBL
  module Tax
    # RateTotal contains a sum of all the tax rates in the document with a matching category and rate.
    class RateTotal < Dry::Struct
      attribute :key, GOBL::Types::String.optional

      attribute :base, GOBL::Num::Amount

      attribute :percent, GOBL::Num::Percentage

      attribute :amount, GOBL::Num::Amount

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          key: data['key'],
          base: GOBL::Num::Amount.from_gobl!(data['base']),
          percent: GOBL::Num::Percentage.from_gobl!(data['percent']),
          amount: GOBL::Num::Amount.from_gobl!(data['amount'])
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'key' => attributes[:key],
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

