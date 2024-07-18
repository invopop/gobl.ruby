# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Pay
    # Online provides the details required to make a payment online using a website
    class Online < GOBL::Object
      # The Schema ID of the GOBL Online structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/Online'

      # @!attribute [r] key
      # Key identifier for this online payment method.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] label
      # Descriptive label for the online provider.
      # @return [String]
      property :label, String

      # @!attribute [r] url
      # URL to be used for payment.
      # @return [String]
      property :url, String
      validates_presence_of :url
    end
  end
end
