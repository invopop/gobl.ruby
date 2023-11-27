# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.63.1
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
      # Short name for the key.
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates_presence_of :name

      # @!attribute [r] desc
      # Description offering more details about when the key should be used.
      # @return [GOBL::I18n::String]
      property :desc, GOBL::I18n::String

      # @!attribute [r] codes
      # Codes describes the list of codes that can be used alongside the Key, for example with identities.
      # @return [Array<CodeDefinition>]
      property :codes, [CodeDefinition]

      # @!attribute [r] map
      # Map helps map local keys to specific codes, useful for converting the described key into a local code.
      # @return [GOBL::CBC::CodeMap]
      property :map, GOBL::CBC::CodeMap
    end
  end
end
