# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class Discount < Model::Struct
      attribute :rate, Model::Types::String.optional

      # How much to deduct
      attribute :value, Model::Types::String

      # Description as to why this discount was applied.
      attribute :reason, Model::Types::String.optional

      # Reason Code
      attribute :code, Model::Types::String.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          rate: gobl['rate'],
          value: gobl['value'],
          reason: gobl['reason'],
          code: gobl['code']
        )
      end

      def to_gobl
        {
          'rate' => attributes[:rate],
          'value' => attributes[:value],
          'reason' => attributes[:reason],
          'code' => attributes[:code]
        }
      end
    end
  end
end
