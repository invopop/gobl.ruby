# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # Charge represents a surchange applied to the complete document independent from the individual lines.
    class Charge < GOBL::Struct
      # Unique identifying for the discount entry
      attribute :uuid, GOBL::UUID::UUID.optional

      # Line number inside the list of discounts (calculated).
      attribute :i, GOBL::Types::Int.optional

      # Code to used to refer to the this charge
      attribute :ref, GOBL::Types::String.optional

      # Base represents the value used as a base for percent calculations. If not already provided, we'll take the invoices sum before discounts.
      attribute :base, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # Percentage to apply to the invoice's Sum
      attribute :percent, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      # Amount to apply (calculated if percent present)
      attribute :amount, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # List of taxes to apply to the charge
      attribute :taxes, GOBL::Tax::Set.optional

      # Code for why was this charge applied?
      attribute :code, GOBL::Types::String.optional

      # Text description as to why the charge was applied
      attribute :reason, GOBL::Types::String.optional

      # Additional semi-structured information.
      attribute :meta, GOBL::Org::Meta.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          i: data['i'],
          ref: data['ref'],
          base: data['base'] ? data['base'] : nil,
          percent: data['percent'] ? data['percent'] : nil,
          amount: data['amount'] ? data['amount'] : nil,
          taxes: data['taxes'] ? GOBL::Tax::Set.from_gobl!(data['taxes']) : nil,
          code: data['code'],
          reason: data['reason'],
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'i' => attributes[:i],
          'ref' => attributes[:ref],
          'base' => attributes[:base]&.to_gobl,
          'percent' => attributes[:percent]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl,
          'taxes' => attributes[:taxes]&.to_gobl,
          'code' => attributes[:code],
          'reason' => attributes[:reason],
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end
    end
  end
end

