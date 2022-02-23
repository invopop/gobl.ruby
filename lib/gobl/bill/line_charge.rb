# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class LineCharge < Dry::Struct
      # Percentage rate if fixed amount not applied
      attribute :rate, GOBL::Num::Percentage.optional

      # Fixed or resulting charge amount to apply
      attribute :amount, GOBL::Num::Amount

      # Reference code.
      attribute :code, GOBL::Types::String.optional

      # Text description as to why the charge was applied
      attribute :reason, GOBL::Types::String.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          rate: data['rate'] ? GOBL::Num::Percentage.from_gobl!(data['rate']) : nil,
          amount: GOBL::Num::Amount.from_gobl!(data['amount']),
          code: data['code'],
          reason: data['reason']
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
