# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Tax
    # RateTotalSurcharge reflects the sum surcharges inside the rate.
    class RateTotalSurcharge < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/total#/$defs/RateTotalSurcharge'

      # @!attribute [r] percent
      # @return [GOBL::Num::Percentage]
      attribute :percent, GOBL::Types.Constructor(GOBL::Num::Percentage)

      # @!attribute [r] amount
      # @return [GOBL::Num::Amount]
      attribute :amount, GOBL::Types.Constructor(GOBL::Num::Amount)

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          percent: data['percent'],
          amount: data['amount']
        )
      end

      def to_gobl
        {
          'percent' => attributes[:percent]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl
        }.compact
      end
    end
  end
end

