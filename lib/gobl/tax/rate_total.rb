# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.36.0
##

module GOBL
  module Tax
    # RateTotal contains a sum of all the tax rates in the document with a matching category and rate.
    class RateTotal < GOBL::Object
      # The Schema ID of the GOBL RateTotal structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/total#/$defs/RateTotal'

      # @!attribute [r] key
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] base
      # @return [GOBL::Num::Amount]
      property :base, GOBL::Num::Amount
      validates :base, presence: true

      # @!attribute [r] percent
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage
      validates :percent, presence: true

      # @!attribute [r] amount
      # Total amount of rate, excluding surcharges
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount
      validates :amount, presence: true

      # @!attribute [r] surcharge
      # @return [RateTotalSurcharge]
      property :surcharge, RateTotalSurcharge
    end
  end
end
