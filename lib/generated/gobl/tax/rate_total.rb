# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.50.5
##

module GOBL
  module Tax
    # RateTotal contains a sum of all the tax rates in the document with a matching category and rate.
    class RateTotal < GOBL::Object
      # The Schema ID of the GOBL RateTotal structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/total#/$defs/RateTotal'

      # @!attribute [r] key
      # Optional rate key is required when grouping.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] base
      # Base amount that the percentage is applied to.
      # @return [GOBL::Num::Amount]
      property :base, GOBL::Num::Amount
      validates_presence_of :base

      # @!attribute [r] percent
      # Percentage of the rate, which may be nil for exempt rates.
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] surcharge
      # Surcharge applied to the rate.
      # @return [RateTotalSurcharge]
      property :surcharge, RateTotalSurcharge

      # @!attribute [r] amount
      # Total amount of rate, excluding surcharges
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount
      validates_presence_of :amount
    end
  end
end
