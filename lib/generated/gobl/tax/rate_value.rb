# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.38.0
##

module GOBL
  module Tax
    # RateValue contains a percentage rate or fixed amount for a given date range.
    class RateValue < GOBL::Object
      # The Schema ID of the GOBL RateValue structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime#/$defs/RateValue'

      # @!attribute [r] zones
      # Only use this value if one of the zones matches.
      # @return [Array<GOBL::L10n::Code>]
      property :zones, [GOBL::L10n::Code]

      # @!attribute [r] since
      # Date from which this value should be applied.
      # @return [GOBL::Cal::Date]
      property :since, GOBL::Cal::Date

      # @!attribute [r] percent
      # Percent rate that should be applied
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage
      validates_presence_of :percent

      # @!attribute [r] surcharge
      # An additional surcharge to apply.
      # @return [GOBL::Num::Percentage]
      property :surcharge, GOBL::Num::Percentage

      # @!attribute [r] disabled
      # When true, this value should no longer be used.
      # @return [Boolean]
      property :disabled, Boolean
    end
  end
end
