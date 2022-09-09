# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Pay
    # Card contains simplified card holder data as a reference for the customer.
    class Card < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/Card'

      # @!attribute [r] last4
      # Last 4 digits of the card's Primary Account Number (PAN).
      # @return [String]
      attribute :last4, GOBL::Types::String

      # @!attribute [r] holder
      # Name of the person whom the card belongs to.
      # @return [String]
      attribute :holder, GOBL::Types::String

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          last4: data['last4'],
          holder: data['holder']
        )
      end

      def to_gobl
        {
          'last4' => attributes[:last4],
          'holder' => attributes[:holder]
        }.compact
      end
    end
  end
end

