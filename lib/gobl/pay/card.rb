# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Pay
    class Card < Dry::Struct
      # Last 4 digits of the card's Primary Account Number (PAN).
      attribute :last4, GOBL::Types::String

      # Name of the person whom the card belongs to.
      attribute :holder, GOBL::Types::String

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          last4: gobl['last4'],
          holder: gobl['holder']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'last4' => attributes[:last4],
          'holder' => attributes[:holder]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
