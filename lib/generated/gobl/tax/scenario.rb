# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # Scenario is used to describe a tax scenario of a document based on the combination of document type and tag used.
    class Scenario < GOBL::Object
      # The Schema ID of the GOBL Scenario structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime-def#/$defs/Scenario'

      # @!attribute [r] name
      # Name of the scenario for further information.
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String

      # @!attribute [r] type
      # Type of document, if present.
      # @return [Array<GOBL::CBC::Key>]
      property :type, [GOBL::CBC::Key]

      # @!attribute [r] tags
      # Array of tags that have been applied to the document.
      # @return [Array<GOBL::CBC::Key>]
      property :tags, [GOBL::CBC::Key]

      # @!attribute [r] ext_key
      # Extension key that must be present in the document.
      # @return [GOBL::CBC::Key]
      property :ext_key, GOBL::CBC::Key

      # @!attribute [r] ext_value
      # Extension value that along side the key must be present for a match to happen. This cannot be used without an `ExtKey`. The value will be copied to the note code if needed.
      # @return [String]
      property :ext_value, String

      # @!attribute [r] note
      # A note to be added to the document if the scenario is applied.
      # @return [GOBL::CBC::Note]
      property :note, GOBL::CBC::Note

      # @!attribute [r] codes
      # Codes is used to define additional codes for regime specific situations.
      # @return [GOBL::CBC::CodeMap]
      property :codes, GOBL::CBC::CodeMap

      # @!attribute [r] ext
      # Ext represents a set of tax extensions that should be applied to the document in the appropriate "tax" context.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions
    end
  end
end
