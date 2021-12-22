# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class Discount < Model::Struct
      attribute :rate, GOBL::Num::Percentage.optional

      # How much to deduct
      attribute :value, GOBL::Num::Amount

      # Description as to why this discount was applied.
      attribute :reason, Model::Types::String.optional

      # Reason Code
      attribute :code, Model::Types::String.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          rate: gobl['rate'] ? GOBL::Num::Percentage.from_gobl!(gobl['rate']) : nil,
          value: GOBL::Num::Amount.from_gobl!(gobl['value']),
          reason: gobl['reason'],
          code: gobl['code']
        )
      end

      def to_gobl
        {
          'rate' => attributes[:rate]&.to_gobl,
          'value' => attributes[:value]&.to_gobl,
          'reason' => attributes[:reason],
          'code' => attributes[:code]
        }
      end
    end
  end
end
