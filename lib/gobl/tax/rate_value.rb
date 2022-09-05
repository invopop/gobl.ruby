# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Tax
    # RateValue contains a percentage rate or fixed amount for a given date range.
    class RateValue < GOBL::Struct
      # Date from which this value should be applied.
      attribute :since, GOBL::Cal::Date.optional

      # Percent rate that should be applied
      attribute :percent, GOBL::Types.Constructor(GOBL::Num::Percentage)

      # An additional surcharge to apply.
      attribute :surcharge, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      # When true, this value should no longer be used.
      attribute :disabled, GOBL::Types::Bool.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          since: data['since'] ? GOBL::Cal::Date.from_gobl!(data['since']) : nil,
          percent: data['percent'],
          surcharge: data['surcharge'] ? data['surcharge'] : nil,
          disabled: data['disabled']
        )
      end

      def to_gobl
        {
          'since' => attributes[:since]&.to_gobl,
          'percent' => attributes[:percent]&.to_gobl,
          'surcharge' => attributes[:surcharge]&.to_gobl,
          'disabled' => attributes[:disabled]
        }
      end
    end
  end
end

