# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.34.1
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
      validates :country, presence: true

      # @!attribute [r] zone
      # Where inside the country the tax identity holder is based for tax purposes like a village, town, district, city, county, state or province. For some areas, this could be a regular post or zip code. See the regime packages for specific validation rules.
      # @return [GOBL::L10n::Code]
      property :zone, GOBL::L10n::Code

      # @!attribute [r] source
      # What is the source document of the tax identity.
      # @return [SourceKey]
      property :source, SourceKey

      # @!attribute [r] code
      # Normalized code shown on the original identity document.
      # @return [String]
      property :code, String

      # @!attribute [r] meta
      # Additional details that may be required.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
