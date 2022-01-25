# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Discount < Dry::Struct
      # Unique identifying for the discount entry
      attribute :uuid, GOBL::Types::String.optional

      # Line number inside the list of discounts
      attribute :i, GOBL::Types::Int

      # Reference or ID for this Discount
      attribute :ref, GOBL::Types::String.optional

      # Base represents the value used as a base for rate calculations. If not already provided, we'll take the invoices sum.
      attribute :base, GOBL::Num::Amount.optional

      # Percentage rate to apply to the invoice's Sum
      attribute :rate, GOBL::Num::Percentage.optional

      # Amount to apply
      attribute :amount, GOBL::Num::Amount

      # List of taxes to apply to the discount
      attribute :taxes, GOBL::Types::Array(GOBL::Tax::Rate).optional

      # Code for the reason this discount applied
      attribute :code, GOBL::Types::String.optional

      # Text description as to why the discount was applied
      attribute :reason, GOBL::Types::String.optional

      # Additional semi-structured information.
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          i: gobl['i'],
          ref: gobl['ref'],
          base: gobl['base'] ? GOBL::Num::Amount.from_gobl!(gobl['base']) : nil,
          rate: gobl['rate'] ? GOBL::Num::Percentage.from_gobl!(gobl['rate']) : nil,
          amount: GOBL::Num::Amount.from_gobl!(gobl['amount']),
          taxes: gobl['taxes']&.map { |x| GOBL::Tax::Rate.from_gobl!(x) },
          code: gobl['code'],
          reason: gobl['reason'],
          meta: gobl['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
          'i' => attributes[:i],
          'ref' => attributes[:ref],
          'base' => attributes[:base]&.to_gobl,
          'rate' => attributes[:rate]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl,
          'taxes' => attributes[:taxes]&.map { |x| x&.to_gobl },
          'code' => attributes[:code],
          'reason' => attributes[:reason],
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
