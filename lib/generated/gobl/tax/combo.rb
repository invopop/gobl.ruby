# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.50.5
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

      # @!attribute [r] rate
      # Rate within a category to apply.
      # @return [GOBL::CBC::Key]
      property :rate, GOBL::CBC::Key

      # @!attribute [r] percent
      # Percent defines the percentage set manually or determined from the rate key (calculated if rate present).
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] surcharge
      # Some countries require an additional surcharge (calculated if rate present).
      # @return [GOBL::Num::Percentage]
      property :surcharge, GOBL::Num::Percentage
    end
  end
end
