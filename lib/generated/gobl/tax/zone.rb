# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.42.0
##

module GOBL
  module Tax
    # Zone represents an area inside a country, like a province or a state, which shares the basic definitions of the country, but may vary in some validation rules.
    class Zone < GOBL::Object
      # The Schema ID of the GOBL Zone structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime#/$defs/Zone'

      # @!attribute [r] code
      # Unique zone code.
      # @return [GOBL::L10n::Code]
      property :code, GOBL::L10n::Code
      validates_presence_of :code

      # @!attribute [r] name
      # Name of the zone to be use if a locality or region is not applicable.
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String

      # @!attribute [r] locality
      # Village, town, district, or city name which should coincide with address data.
      # @return [GOBL::I18n::String]
      property :locality, GOBL::I18n::String

      # @!attribute [r] region
      # Province, county, or state which should match address data.
      # @return [GOBL::I18n::String]
      property :region, GOBL::I18n::String

      # @!attribute [r] meta
      # Any additional information
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
