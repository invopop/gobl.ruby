# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # RateValueDef contains a percentage rate or fixed amount for a given date range.
    class RateValueDef < GOBL::Object
      # The Schema ID of the GOBL RateValueDef structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime-def#/$defs/RateValueDef'

      # @!attribute [r] ext
      # Only apply this rate if one of the tags is present in the invoice. Tags []cbc.Key `json:"tags,omitempty" jsonschema:"title=Tags"` Ext map of keys that can be used to filter to determine if the rate applies.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

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
