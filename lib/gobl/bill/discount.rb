# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.23.0
##

require 'dry-struct'

module GOBL
  module Bill
    # Discount represents an allowance applied to the complete document independent from the individual lines.
    class Discount < Dry::Struct
      # Unique identifying for the discount entry
      attribute :uuid, GOBL::Types::String.optional

      # Line number inside the list of discounts
      attribute :i, GOBL::Types::Int

      # Reference or ID for this Discount
      attribute :ref, GOBL::Types::String.optional

      # Base represents the value used as a base for percent calculations. If not already provided, we'll take the invoices sum.
      attribute :base, GOBL::Num::Amount.optional

      # Percentage to apply to the invoice's Sum
      attribute :percent, GOBL::Num::Percentage.optional

      # Amount to apply
      attribute :amount, GOBL::Num::Amount

      # List of taxes to apply to the discount
      attribute :taxes, GOBL::Tax::Set.optional

      # Code for the reason this discount applied
      attribute :code, GOBL::Types::String.optional

      # Text description as to why the discount was applied
      attribute :reason, GOBL::Types::String.optional

      # Additional semi-structured information.
      attribute :meta, GOBL::Org::Meta.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'],
          i: data['i'],
          ref: data['ref'],
          base: data['base'] ? GOBL::Num::Amount.from_gobl!(data['base']) : nil,
          percent: data['percent'] ? GOBL::Num::Percentage.from_gobl!(data['percent']) : nil,
          amount: GOBL::Num::Amount.from_gobl!(data['amount']),
          taxes: data['taxes'] ? GOBL::Tax::Set.from_gobl!(data['taxes']) : nil,
          code: data['code'],
          reason: data['reason'],
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
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
          'percent' => attributes[:percent]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl,
          'taxes' => attributes[:taxes]&.to_gobl,
          'code' => attributes[:code],
          'reason' => attributes[:reason],
          'meta' => attributes[:meta]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

