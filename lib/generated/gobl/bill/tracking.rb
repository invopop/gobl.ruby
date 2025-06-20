# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # Tracking stores tracking information about a delivery.
    class Tracking < GOBL::Object
      # The Schema ID of the GOBL Tracking structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/delivery#/$defs/Tracking'

      # @!attribute [r] code
      # Code used for tracking
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] website
      # Website to access for more tracking details
      # @return [GOBL::Org::Website]
      property :website, GOBL::Org::Website
    end
  end
end
