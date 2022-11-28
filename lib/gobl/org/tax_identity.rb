# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.31.0
##

module GOBL
  module Org
    # TaxIdentity stores the details required to identify an entity for tax purposes.
    class TaxIdentity < GOBL::Object
      # The Schema ID of the GOBL TaxIdentity structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/tax-identity'

      # @!attribute [r] uuid
      # Unique universal identity code.
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] country
      # ISO country code for Where the tax identity was issued.
      # @return [GOBL::L10n::CountryCode]
      property :country, GOBL::L10n::CountryCode
      validates :country, presence: true

      # @!attribute [r] locality
      # Where inside a country the Tax ID was issued, if required.
      # @return [GOBL::L10n::Code]
      property :locality, GOBL::L10n::Code

      # @!attribute [r] source
      # What is the source document of this tax identity.
      # @return [SourceKey]
      property :source, SourceKey

      # @!attribute [r] code
      # Tax identity Code
      # @return [String]
      property :code, String

      # @!attribute [r] meta
      # Additional details that may be required.
      # @return [GOBL::Org::Meta]
      property :meta, GOBL::Org::Meta
    end
  end
end
