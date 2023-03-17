# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.38.0
##

module GOBL
  module Tax
    # Identity stores the details required to identify an entity for tax purposes.
    class Identity < GOBL::Object
      # The Schema ID of the GOBL Identity structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/identity'

      # @!attribute [r] uuid
      # Unique universal identity code for this tax identity.
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] country
      # ISO country code for Where the tax identity was issued.
      # @return [GOBL::L10n::CountryCode]
      property :country, GOBL::L10n::CountryCode
      validates_presence_of :country

      # @!attribute [r] zone
      # Where inside the country the tax identity holder is based for tax purposes like a village, town, district, city, county, state or province. For some areas, this could be a regular post or zip code. See the regime packages for specific validation rules.
      # @return [GOBL::L10n::Code]
      property :zone, GOBL::L10n::Code

      # Enumeration of possible values for {#source} with their corresponding descriptions
      SOURCE_ENUM = {
        'tax-agency' => 'Sourced directly from a tax agency',
        'passport' => 'A passport document',
        'national' => 'National ID Card or similar',
        'permit' => 'Residential or similar permit',
        'other' => 'An other type of source not listed'
      }.freeze

      # @!attribute [r] source
      # What is the source document of the tax identity.
      # @return [GOBL::CBC::Key]
      property :source, GOBL::CBC::Key
      validates_inclusion_of :source, in: SOURCE_ENUM.keys, allow_blank: true

      # @!attribute [r] code
      # Normalized code shown on the original identity document.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] meta
      # Additional details that may be required.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
