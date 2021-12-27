# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class ItemID < GOBL::Struct
      attribute :value, GOBL::Types::String

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          value: gobl['value']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'value' => attributes[:value]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
