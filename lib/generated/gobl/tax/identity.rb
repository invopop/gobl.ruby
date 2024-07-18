# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # Identity stores the details required to identify an entity for tax purposes in a specific country.
    class Identity < GOBL::Object
      # The Schema ID of the GOBL Identity structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/identity'

      # @!attribute [r] country
      # ISO country code for Where the tax identity was issued.
      # @return [GOBL::L10n::CountryCode]
      property :country, GOBL::L10n::CountryCode
      validates_presence_of :country

      # @!attribute [r] code
      # Normalized code shown on the original identity document.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] type
      # Type is set according to the requirements of each regime, some have a single tax document type code, others require a choice to be made. Deprecated: Tax Identities should only be used for VAT or similar codes for companies. Use the identities array for other types of identification.
      # @return [GOBL::CBC::Key]
      property :type, GOBL::CBC::Key

      # @!attribute [r] zone
      # Zone identifies a sub-locality within a country. Deprecated: Removed 2024-03-14 in favour of using tax tags and extensions with local data when required. Maintained here to support data migration.
      # @return [GOBL::L10n::Code]
      property :zone, GOBL::L10n::Code
    end
  end
end
