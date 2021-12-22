# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class Value < Model::Struct
      # Date from which this value should be applied.
      attribute :since, GOBL::Org::Date.optional

      # Rate that should be applied.
      attribute :percent, GOBL::Num::Percentage

      # When true
      attribute :disabled, Model::Types::Bool.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          since: gobl['since'] ? GOBL::Org::Date.from_gobl!(gobl['since']) : nil,
          percent: GOBL::Num::Percentage.from_gobl!(gobl['percent']),
          disabled: gobl['disabled']
        )
      end

      def to_gobl
        {
          'since' => attributes[:since]&.to_gobl,
          'percent' => attributes[:percent]&.to_gobl,
          'disabled' => attributes[:disabled]
        }
      end
    end
  end
end
