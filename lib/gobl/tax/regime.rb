# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.34.1
##

module GOBL
  module Tax
    # Regime defines the holding structure for the definitions of taxes inside a country or territory.
    class Regime < GOBL::Object
      # The Schema ID of the GOBL Regime structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime'

      # @!attribute [r] name
      # Name of the country
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates :name, presence: true

      # @!attribute [r] country
      # Country code for the region
      # @return [GOBL::L10n::CountryCode]
      property :country, GOBL::L10n::CountryCode
      validates :country, presence: true

      # @!attribute [r] zone
      # Specific Locality, region, city, province, county, or similar code inside the country, if needed.
      # @return [GOBL::L10n::Code]
      property :zone, GOBL::L10n::Code

      # @!attribute [r] zones
      # List of sub-zones inside a country.
      # @return [Array<Zone>]
      property :zones, [Zone]

      # @!attribute [r] currency
      # Currency used by the country.
      # @return [GOBL::Currency::Code]
      property :currency, GOBL::Currency::Code
      validates :currency, presence: true

      # @!attribute [r] schemes
      # Set of specific scheme definitions inside the region.
      # @return [Schemes]
      property :schemes, Schemes

      # @!attribute [r] categories
      # List of tax categories.
      # @return [Array<Category>]
      property :categories, [Category]
      validates :categories, presence: true
    end
  end
end
