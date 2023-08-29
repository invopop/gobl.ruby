# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.55.0
##

module GOBL
  module Tax
    # Scenario is used to describe a tax scenario of a document based on the combination of document type and tag used.
    class Scenario < GOBL::Object
      # The Schema ID of the GOBL Scenario structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime#/$defs/Scenario'

      # @!attribute [r] type
      # Type of document, if present.
      # @return [Array<GOBL::CBC::Key>]
      property :type, [GOBL::CBC::Key]

      # @!attribute [r] tags
      # Tag that was applied to the document
      # @return [Array<GOBL::CBC::Key>]
      property :tags, [GOBL::CBC::Key]

      # @!attribute [r] name
      # Name of the scenario for further information.
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String

      # @!attribute [r] note
      # A note to be added to the document if the scenario is applied.
      # @return [GOBL::CBC::Note]
      property :note, GOBL::CBC::Note

      # @!attribute [r] codes
      # Codes is used to define additional codes for regime specific situations.
      # @return [GOBL::CBC::CodeMap]
      property :codes, GOBL::CBC::CodeMap

      # @!attribute [r] meta
      # Any additional local meta data that may be useful in integrations.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
