# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.28.1
##

require 'dry-struct'

module GOBL
  module Bill
    # LineCharge represents an amount added to the line, and will be applied before taxes.
    class LineCharge < Dry::Struct
      # Percentage if fixed amount not applied
      attribute :percent, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      # Fixed or resulting charge amount to apply
      attribute :amount, GOBL::Types.Constructor(GOBL::Num::Amount)

      # Reference code.
      attribute :code, GOBL::Types::String.optional

      # Text description as to why the charge was applied
      attribute :reason, GOBL::Types::String.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          percent: data['percent'] ? data['percent'] : nil,
          amount: data['amount'],
          code: data['code'],
          reason: data['reason']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'percent' => attributes[:percent]&.to_gobl,
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

