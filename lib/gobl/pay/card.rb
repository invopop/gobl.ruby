# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.29.0
##

require 'dry-struct'

module GOBL
  module Pay
    # Card contains simplified card holder data as a reference for the customer.
    class Card < Dry::Struct
      # Last 4 digits of the card's Primary Account Number (PAN).
      attribute :last4, GOBL::Types::String

      # Name of the person whom the card belongs to.
      attribute :holder, GOBL::Types::String

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          last4: data['last4'],
          holder: data['holder']
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

