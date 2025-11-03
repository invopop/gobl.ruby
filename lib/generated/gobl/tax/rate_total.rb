# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # RateTotal contains a sum of all the tax rates in the document with a matching category and rate.
    class RateTotal < GOBL::Object
      # The Schema ID of the GOBL RateTotal structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/total#/$defs/RateTotal'

      # @!attribute [r] country
      # Country code override when issuing with taxes applied from different countries, it'd be very strange to mix rates from different countries, but in theory this would be possible.
      # @return [GOBL::L10n::TaxCountryCode]
      property :country, GOBL::L10n::TaxCountryCode

      # @!attribute [r] key
      # Tax key if supported by the category.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] ext
      # If the rate is defined with extensions, they'll be used to group by also.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

      # @!attribute [r] base
      # Base amount that the percentage is applied to.
      # @return [GOBL::Num::Amount]
      property :base, GOBL::Num::Amount
      validates_presence_of :base

      # @!attribute [r] percent
      # Percentage of the rate. Will be nil when taxes are **exempt**.
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
