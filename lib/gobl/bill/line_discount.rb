# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class LineDiscount < Dry::Struct
      # Percentage rate if fixed amount not applied
      attribute :rate, GOBL::Num::Percentage.optional

      # Fixed discount amount to apply
      attribute :amount, GOBL::Num::Amount

      # Reason code.
      attribute :code, GOBL::Types::String.optional

      # Text description as to why the discount was applied
      attribute :reason, GOBL::Types::String.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          rate: gobl['rate'] ? GOBL::Num::Percentage.from_gobl!(gobl['rate']) : nil,
          amount: GOBL::Num::Amount.from_gobl!(gobl['amount']),
          code: gobl['code'],
          reason: gobl['reason']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'rate' => attributes[:rate]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl,
          'code' => attributes[:code],
          'reason' => attributes[:reason]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
