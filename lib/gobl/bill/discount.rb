# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # Discount represents an allowance applied to the complete document independent from the individual lines.
    class Discount < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Discount'

      # @!attribute [r] uuid
      # Unique identifying for the discount entry
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] i
      # Line number inside the list of discounts (calculated)
      # @return [Integer]
      attribute? :i, GOBL::Types::Int.optional

      # @!attribute [r] ref
      # Reference or ID for this Discount
      # @return [String]
      attribute? :ref, GOBL::Types::String.optional

      # @!attribute [r] base
      # Base represents the value used as a base for percent calculations. If not already provided, we'll take the invoices sum.
      # @return [GOBL::Num::Amount]
      attribute? :base, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # @!attribute [r] percent
      # Percentage to apply to the invoice's Sum.
      # @return [GOBL::Num::Percentage]
      attribute? :percent, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      # @!attribute [r] amount
      # Amount to apply (calculated if percent present).
      # @return [GOBL::Num::Amount]
      attribute? :amount, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # @!attribute [r] taxes
      # List of taxes to apply to the discount
      # @return [GOBL::Tax::Set]
      attribute? :taxes, GOBL::Tax::Set.optional

      # @!attribute [r] code
      # Code for the reason this discount applied
      # @return [String]
      attribute? :code, GOBL::Types::String.optional

      # @!attribute [r] reason
      # Text description as to why the discount was applied
      # @return [String]
      attribute? :reason, GOBL::Types::String.optional

      # @!attribute [r] meta
      # Additional semi-structured information.
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

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

