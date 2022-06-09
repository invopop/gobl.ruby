# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.24.0
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
      attribute :percent, GOBL::Types.Constructor(GOBL::Num::Percentage)

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          cat: data['cat'],
          rate: data['rate'],
          percent: data['percent']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'cat' => attributes[:cat],
          'rate' => attributes[:rate],
          'percent' => attributes[:percent]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

