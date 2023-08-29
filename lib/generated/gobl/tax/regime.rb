# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.55.0
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
      validates_presence_of :name

      # @!attribute [r] time_zone
      # Location name for the country's central time zone. Accepted values from IANA Time Zone Database (https://iana.org/time-zones).
      # @return [String]
      property :time_zone, String
      validates_presence_of :time_zone

      # @!attribute [r] country
      # Country code for the region
      # @return [GOBL::L10n::CountryCode]
      property :country, GOBL::L10n::CountryCode
      validates_presence_of :country

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
      validates_presence_of :currency

      # @!attribute [r] tags
      # Tags that can be applied at the document level to identify additional considerations.
      # @return [Array<KeyDefinition>]
      property :tags, [KeyDefinition]

      # @!attribute [r] identity_types
      # Identity types specific for the regime and may be validated against.
      # @return [Array<KeyDefinition>]
      property :identity_types, [KeyDefinition]

      # @!attribute [r] extensions
      # Extensions defines the keys that can be used for extended or extra data inside the regime that is specific to the regime and cannot be easily determined from other GOBL structures. Typically these are used to define local codes for suppliers, customers, products, or tax rates.
      # @return [Array<KeyDefinition>]
      property :extensions, [KeyDefinition]

      # @!attribute [r] charge_types
      # Charge types specific for the regime and may be validated or used in the UI as suggestions
      # @return [Array<KeyDefinition>]
      property :charge_types, [KeyDefinition]

      # @!attribute [r] payment_means
      # PaymentMeansKeys specific for the regime that extend the original base payment means keys.
      # @return [Array<KeyDefinition>]
      property :payment_means, [KeyDefinition]

      # @!attribute [r] item_keys
      # ItemKeys specific for the regime that need to be added to `org.Item` data in line rows.
      # @return [Array<KeyDefinition>]
      property :item_keys, [KeyDefinition]

      # @!attribute [r] scenarios
      # Sets of scenario definitions for the regime.
      # @return [Array<ScenarioSet>]
      property :scenarios, [ScenarioSet]

      # @!attribute [r] preceding
      # Configuration details for preceding options.
      # @return [PrecedingDefinitions]
      property :preceding, PrecedingDefinitions

      # @!attribute [r] categories
      # List of tax categories.
      # @return [Array<Category>]
      property :categories, [Category]
      validates_presence_of :categories
    end
  end
end
