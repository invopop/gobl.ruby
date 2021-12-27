# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Org
    class Discount < Dry::Struct
      attribute :rate, GOBL::Num::Percentage.optional

      # How much to deduct
      attribute :value, GOBL::Num::Amount

      # Description as to why this discount was applied.
      attribute :reason, GOBL::Types::String.optional

      # Reason Code
      attribute :code, GOBL::Types::String.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          rate: gobl['rate'] ? GOBL::Num::Percentage.from_gobl!(gobl['rate']) : nil,
          value: GOBL::Num::Amount.from_gobl!(gobl['value']),
          reason: gobl['reason'],
          code: gobl['code']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'rate' => attributes[:rate]&.to_gobl,
          'value' => attributes[:value]&.to_gobl,
          'reason' => attributes[:reason],
          'code' => attributes[:code]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
