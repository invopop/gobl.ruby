# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.50.5
##

module GOBL
  module Tax
    # KeyDefinition defines properties of a key that is specific for a regime.
    class KeyDefinition < GOBL::Object
      # The Schema ID of the GOBL KeyDefinition structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime#/$defs/KeyDefinition'

      # @!attribute [r] key
      # Actual key value.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key
      validates_presence_of :key

      # @!attribute [r] name
      # Short name for the key, if relevant.
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String

      # @!attribute [r] desc
      # Description offering more details about when the key should be used.
      # @return [GOBL::I18n::String]
      property :desc, GOBL::I18n::String

      # @!attribute [r] codes
      # Codes defines a set of codes that may be used within a given regime or format that will help identify which key definition to use.
      # @return [GOBL::CBC::CodeSet]
      property :codes, GOBL::CBC::CodeSet

      # @!attribute [r] meta
      # Any additional data that might be relevant in some regimes.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
