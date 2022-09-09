# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # LineDiscount represents an amount deducted from the line, and will be applied before taxes.
    class LineDiscount < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/LineDiscount'

      # @!attribute [r] percent
      # Percentage if fixed amount not applied
      # @return [GOBL::Num::Percentage]
      attribute? :percent, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      # @!attribute [r] amount
      # Fixed discount amount to apply (calculated if percent present).
      # @return [GOBL::Num::Amount]
      attribute? :amount, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # @!attribute [r] code
      # Reason code.
      # @return [String]
      attribute? :code, GOBL::Types::String.optional

      # @!attribute [r] reason
      # Text description as to why the discount was applied
      # @return [String]
      attribute? :reason, GOBL::Types::String.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          percent: data['percent'] ? data['percent'] : nil,
          amount: data['amount'] ? data['amount'] : nil,
          code: data['code'],
          reason: data['reason']
        )
      end

      def to_gobl
        {
          'percent' => attributes[:percent]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl,
          'code' => attributes[:code],
          'reason' => attributes[:reason]
        }.compact
      end
    end
  end
end

