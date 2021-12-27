# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Tax
    class Rate < Dry::Struct
      # From the available options for the region.
      attribute :cat, GOBL::Types::String

      # As defined for the region and category.
      attribute :code, GOBL::Types::String

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          cat: gobl['cat'],
          code: gobl['code']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'cat' => attributes[:cat],
          'code' => attributes[:code]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
