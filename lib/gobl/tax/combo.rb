# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.28.1
##

require 'dry-struct'

module GOBL
  module Tax
    # Combo represents the tax combination of a category code and rate key.
    class Combo < Dry::Struct
      # Tax category code from those available inside a region.
      attribute :cat, GOBL::Org::Code

      # Rate within a category to apply.
      attribute :rate, GOBL::Org::Key.optional

      # Percent defines the percentage set manually or determined from the rate key.
      attribute :percent, GOBL::Types.Constructor(GOBL::Num::Percentage)

      # Some countries require an additional surcharge.
      attribute :surcharge, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          cat: GOBL::Org::Code.from_gobl!(data['cat']),
          rate: data['rate'] ? GOBL::Org::Key.from_gobl!(data['rate']) : nil,
          percent: data['percent'],
          surcharge: data['surcharge'] ? data['surcharge'] : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'cat' => attributes[:cat]&.to_gobl,
          'rate' => attributes[:rate]&.to_gobl,
          'percent' => attributes[:percent]&.to_gobl,
          'surcharge' => attributes[:surcharge]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

