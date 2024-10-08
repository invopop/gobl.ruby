# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # Combo represents the tax combination of a category code and rate key.
    class Combo < GOBL::Object
      # The Schema ID of the GOBL Combo structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/set#/$defs/Combo'

      # @!attribute [r] cat
      # Tax category code from those available inside a region.
      # @return [GOBL::CBC::Code]
      property :cat, GOBL::CBC::Code
      validates_presence_of :cat

      # @!attribute [r] country
      # Country code override when issuing with taxes applied from different countries.
      # @return [GOBL::L10n::TaxCountryCode]
      property :country, GOBL::L10n::TaxCountryCode

      # @!attribute [r] rate
      # Rate within a category to apply.
      # @return [GOBL::CBC::Key]
      property :rate, GOBL::CBC::Key

      # @!attribute [r] percent
      # Percent defines the percentage set manually or determined from the rate key (calculated if rate present). A nil percent implies that this tax combo is **exempt** from tax.
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] surcharge
      # Some countries require an additional surcharge (calculated if rate present).
      # @return [GOBL::Num::Percentage]
      property :surcharge, GOBL::Num::Percentage

      # @!attribute [r] ext
      # Local codes that apply for a given rate or percentage that need to be identified and validated.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions
    end
  end
end
