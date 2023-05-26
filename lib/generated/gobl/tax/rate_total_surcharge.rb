# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.50.1
##

module GOBL
  module Tax
    # RateTotalSurcharge reflects the sum surcharges inside the rate.
    class RateTotalSurcharge < GOBL::Object
      # The Schema ID of the GOBL RateTotalSurcharge structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/total#/$defs/RateTotalSurcharge'

      # @!attribute [r] percent
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage
      validates_presence_of :percent

      # @!attribute [r] amount
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount
      validates_presence_of :amount
    end
  end
end
