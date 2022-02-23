# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Charge < Dry::Struct
      # Unique identifying for the discount entry
      attribute :uuid, GOBL::Types::String.optional

      # Line number inside the list of discounts
      attribute :i, GOBL::Types::Int

      # Code to used to refer to the this charge
      attribute :ref, GOBL::Types::String.optional

      # Base represents the value used as a base for rate calculations. If not already provided, we'll take the invoices sum before discounts.
      attribute :base, GOBL::Num::Amount.optional

      # Percentage rate to apply to the invoice's Sum
      attribute :rate, GOBL::Num::Percentage.optional

      # Amount to apply
      attribute :amount, GOBL::Num::Amount

      # List of taxes to apply to the charge
      attribute :taxes, GOBL::Types::Array(GOBL::Tax::Rate).optional

      # Code for why was this charge applied?
      attribute :code, GOBL::Types::String.optional

      # Text description as to why the charge was applied
      attribute :reason, GOBL::Types::String.optional

      # Additional semi-structured information.
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'],
          i: data['i'],
          ref: data['ref'],
          base: data['base'] ? GOBL::Num::Amount.from_gobl!(data['base']) : nil,
          rate: data['rate'] ? GOBL::Num::Percentage.from_gobl!(data['rate']) : nil,
          amount: GOBL::Num::Amount.from_gobl!(data['amount']),
          taxes: data['taxes']&.map { |item| GOBL::Tax::Rate.from_gobl!(item) },
          code: data['code'],
          reason: data['reason'],
          meta: data['meta']
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
          'taxes' => attributes[:taxes]&.map { |item| item&.to_gobl },
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
