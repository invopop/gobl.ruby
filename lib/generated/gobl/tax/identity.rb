# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.69.0
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

      # @!attribute [r] type
      # Type is set according the requirements of each regime, some have a single tax document type code, others require a choice to be made.
      # @return [GOBL::CBC::Key]
      property :type, GOBL::CBC::Key

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
