# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Tax
    # RateTotal contains a sum of all the tax rates in the document with a matching category and rate.
    class RateTotal < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/total#/$defs/RateTotal'

      # @!attribute [r] key
      # @return [GOBL::Org::Key]
      attribute? :key, GOBL::Org::Key.optional

      # @!attribute [r] base
      # @return [GOBL::Num::Amount]
      attribute :base, GOBL::Types.Constructor(GOBL::Num::Amount)

      # @!attribute [r] percent
      # @return [GOBL::Num::Percentage]
      attribute :percent, GOBL::Types.Constructor(GOBL::Num::Percentage)

      # @!attribute [r] amount
      # Total amount of rate, excluding surcharges
      # @return [GOBL::Num::Amount]
      attribute :amount, GOBL::Types.Constructor(GOBL::Num::Amount)

      # @!attribute [r] surcharge
      # @return [RateTotalSurcharge]
      attribute? :surcharge, RateTotalSurcharge.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          key: data['key'] ? GOBL::Org::Key.from_gobl!(data['key']) : nil,
          base: data['base'],
          percent: data['percent'],
          amount: data['amount'],
          surcharge: data['surcharge'] ? RateTotalSurcharge.from_gobl!(data['surcharge']) : nil
        )
      end

      def to_gobl
        {
          'key' => attributes[:key]&.to_gobl,
          'base' => attributes[:base]&.to_gobl,
          'percent' => attributes[:percent]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl,
          'surcharge' => attributes[:surcharge]&.to_gobl
        }.compact
      end
    end
  end
end

