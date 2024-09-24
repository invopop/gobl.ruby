# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module CBC
    # KeyDefinition defines properties of a key that is specific for a regime.
    class KeyDefinition < GOBL::Object
      # The Schema ID of the GOBL KeyDefinition structure
      SCHEMA_ID = 'https://gobl.org/draft-0/cbc/key-definition'

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

      # @!attribute [r] meta
      # Meta defines any additional details that may be useful or associated with the key.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta

      # @!attribute [r] values
      # Values defines the possible values associated with the key.
      # @return [Array<GOBL::CBC::ValueDefinition>]
      property :values, [GOBL::CBC::ValueDefinition]

      # @!attribute [r] pattern
      # Pattern is used to validate the key value instead of using a fixed value from the code or key definitions.
      # @return [String]
      property :pattern, String

      # @!attribute [r] map
      # Map helps map local keys to specific codes, useful for converting the described key into a local code.
      # @return [GOBL::CBC::CodeMap]
      property :map, GOBL::CBC::CodeMap
    end
  end
end
