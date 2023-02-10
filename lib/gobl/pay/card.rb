# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.36.0
##

module GOBL
  module Pay
    # Card contains simplified card holder data as a reference for the customer.
    class Card < GOBL::Object
      # The Schema ID of the GOBL Card structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/Card'

      # @!attribute [r] last4
      # Last 4 digits of the card's Primary Account Number (PAN).
      # @return [String]
      property :last4, String
      validates :last4, presence: true

      # @!attribute [r] holder
      # Name of the person whom the card belongs to.
      # @return [String]
      property :holder, String
      validates :holder, presence: true
    end
  end
end
