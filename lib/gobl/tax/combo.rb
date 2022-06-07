# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.23.0
##

require 'dry-struct'

module GOBL
  module Tax
    # Combo represents the tax combination of a category code and rate key.
    class Combo < Dry::Struct
      # Tax category code from those available inside a region.
      attribute :cat, GOBL::Types::String

      # Rate within a category to apply.
      attribute :rate, GOBL::Types::String.optional

      # Percent defines the percentage set manually or determined from the rate key.
      attribute :percent, GOBL::Num::Percentage

      # Retained when true indicates the percent is retained from the totals instead of added.
      attribute :retained, GOBL::Types::Bool.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          cat: data['cat'],
          rate: data['rate'],
          percent: GOBL::Num::Percentage.from_gobl!(data['percent']),
          retained: data['retained']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'cat' => attributes[:cat],
          'rate' => attributes[:rate],
          'percent' => attributes[:percent]&.to_gobl,
          'retained' => attributes[:retained]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

