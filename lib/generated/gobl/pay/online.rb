# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.50.1
##

module GOBL
  module Pay
    # Online provides the details required to make a payment online using a website
    class Online < GOBL::Object
      # The Schema ID of the GOBL Online structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/Online'

      # @!attribute [r] name
      # Descriptive name given to the online provider.
      # @return [String]
      property :name, String

      # @!attribute [r] addr
      # Full URL to be used for payment.
      # @return [String]
      property :addr, String
      validates_presence_of :addr
    end
  end
end
