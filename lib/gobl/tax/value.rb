# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Tax
    class Value < Dry::Struct
      # Date from which this value should be applied.
      attribute :since, GOBL::Org::Date.optional

      # Rate that should be applied
      attribute :percent, GOBL::Num::Percentage

      # When true, this value should no longer be used.
      attribute :disabled, GOBL::Types::Bool.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          since: data['since'] ? GOBL::Org::Date.from_gobl!(data['since']) : nil,
          percent: GOBL::Num::Percentage.from_gobl!(data['percent']),
          disabled: data['disabled']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'since' => attributes[:since]&.to_gobl,
          'percent' => attributes[:percent]&.to_gobl,
          'disabled' => attributes[:disabled]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
