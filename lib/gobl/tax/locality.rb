# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.32.0
##

module GOBL
  module Tax
    # Locality represents an area inside a region, like a province or a state, which shares the basic definitions of the region, but may vary in some validation rules.
    class Locality < GOBL::Object
      # The Schema ID of the GOBL Locality structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/region#/$defs/Locality'

      # @!attribute [r] code
      # Code
      # @return [GOBL::L10n::Code]
      property :code, GOBL::L10n::Code
      validates :code, presence: true

      # @!attribute [r] name
      # Name of the locality with local and hopefully international translations.
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates :name, presence: true

      # @!attribute [r] meta
      # Any additional information
      # @return [GOBL::Org::Meta]
      property :meta, GOBL::Org::Meta
    end
  end
end
