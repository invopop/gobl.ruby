# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
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

      # @!attribute [r] description
      # Introductory details about the regime.
      # @return [GOBL::I18n::String]
      property :description, GOBL::I18n::String

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

      # @!attribute [r] currency
      # Currency used by the country.
      # @return [GOBL::Currency::Code]
      property :currency, GOBL::Currency::Code
      validates_presence_of :currency

      # @!attribute [r] tags
      # Tags that can be applied at the document level to identify additional considerations.
      # @return [Array<GOBL::CBC::KeyDefinition>]
      property :tags, [GOBL::CBC::KeyDefinition]

      # @!attribute [r] extensions
      # Extensions defines the keys that can be used for extended or extra data inside the regime that is specific to the regime and cannot be easily determined from other GOBL structures. Typically these are used to define local codes for suppliers, customers, products, or tax rates.
      # @return [Array<GOBL::CBC::KeyDefinition>]
      property :extensions, [GOBL::CBC::KeyDefinition]

      # @!attribute [r] tax_identity_type_keys
      # Tax Identity types specific for the regime and may be validated against.
      # @return [Array<GOBL::CBC::KeyDefinition>]
      property :tax_identity_type_keys, [GOBL::CBC::KeyDefinition]

      # @!attribute [r] identity_keys
      # Identity keys used in addition to regular tax identities and specific for the regime that may be validated against.
      # @return [Array<GOBL::CBC::KeyDefinition>]
      property :identity_keys, [GOBL::CBC::KeyDefinition]

      # @!attribute [r] charge_keys
      # Charge keys specific for the regime and may be validated or used in the UI as suggestions
      # @return [Array<GOBL::CBC::KeyDefinition>]
      property :charge_keys, [GOBL::CBC::KeyDefinition]

      # @!attribute [r] payment_means_keys
      # PaymentMeansKeys specific for the regime that extend the original base payment means keys.
      # @return [Array<GOBL::CBC::KeyDefinition>]
      property :payment_means_keys, [GOBL::CBC::KeyDefinition]

      # @!attribute [r] inbox_keys
      # InboxKeys specific to the regime that can be used to identify where a document should be forwarded to.
      # @return [Array<GOBL::CBC::KeyDefinition>]
      property :inbox_keys, [GOBL::CBC::KeyDefinition]

      # @!attribute [r] scenarios
      # @return [Array<ScenarioSet>]
      property :scenarios, [ScenarioSet]

      # @!attribute [r] corrections
      # Configuration details for corrections to be used with correction options.
      # @return [Array<CorrectionDefinition>]
      property :corrections, [CorrectionDefinition]

      # @!attribute [r] categories
      # List of tax categories.
      # @return [Array<Category>]
      property :categories, [Category]
      validates_presence_of :categories
    end
  end
end
