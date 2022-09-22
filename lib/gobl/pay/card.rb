# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.3
##


module GOBL
  module Pay
    # Card contains simplified card holder data as a reference for the customer.
    class Card < GOBL::Struct
      # The Schema ID of the GOBL Card structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/Card'

      # @!attribute [r] last4
      # Last 4 digits of the card's Primary Account Number (PAN).
      # @return [String]
      attribute :last4, GOBL::Types::String

      # @!attribute [r] holder
      # Name of the person whom the card belongs to.
      # @return [String]
      attribute :holder, GOBL::Types::String

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Card] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          last4: data['last4'],
          holder: data['holder']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'last4' => attributes[:last4],
          'holder' => attributes[:holder]
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Card} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Card] the object corresponding to the given input
    end
  end
end

