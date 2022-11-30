# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.32.0
##

module GOBL
  module Tax
    # Region defines the holding structure for a regions categories and subsequent Rates and Values.
    class Region < GOBL::Object
      # The Schema ID of the GOBL Region structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/region'

      # @!attribute [r] name
      # Name of the region
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates :name, presence: true

      # @!attribute [r] country
      # Country code for the region
      # @return [GOBL::L10n::CountryCode]
      property :country, GOBL::L10n::CountryCode
      validates :country, presence: true

      # @!attribute [r] locality
      # Locality, city, province, county, or similar code inside the country, if needed.
      # @return [GOBL::L10n::Code]
      property :locality, GOBL::L10n::Code

      # @!attribute [r] localities
      # List of sub-localities inside a region.
      # @return [Array<Locality>]
      property :localities, [Locality]

      # @!attribute [r] currency
      # Currency used by the region for tax purposes.
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
