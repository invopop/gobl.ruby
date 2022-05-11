# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Tax
    # Combo represents the tax combination of a category code and rate key.
    class Combo < Dry::Struct
      # Tax category code from those available inside a region.
      attribute :cat, GOBL::Types::String

      # Rate within a category to apply.
      attribute :rate, GOBL::Types::String

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          cat: data['cat'],
          rate: data['rate']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'cat' => attributes[:cat],
          'rate' => attributes[:rate]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

