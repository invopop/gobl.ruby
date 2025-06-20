# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Pay
    # Card contains simplified card holder data as a reference for the customer.
    class Card < GOBL::Object
      # The Schema ID of the GOBL Card structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/Card'

      # @!attribute [r] first6
      # First 6 digits of the card's Primary Account Number (PAN).
      # @return [String]
      property :first6, String

      # @!attribute [r] last4
      # Last 4 digits of the card's Primary Account Number (PAN).
      # @return [String]
      property :last4, String

      # @!attribute [r] holder
      # Name of the person whom the card belongs to.
      # @return [String]
      property :holder, String
    end
  end
end
