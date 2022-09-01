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
      # Percentage if fixed amount not applied
      attribute? :percent, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      # Fixed discount amount to apply (calculated if percent present).
      attribute? :amount, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # Reason code.
      attribute? :code, GOBL::Types::String.optional

      # Text description as to why the discount was applied
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
        }
      end
    end
  end
end

