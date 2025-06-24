# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # ScenarioNote represents the structure of the note that needs to be added to the document.
    class ScenarioNote < GOBL::Object
      # The Schema ID of the GOBL ScenarioNote structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime-def#/$defs/ScenarioNote'

      # @!attribute [r] key
      # Key specifying subject of the text
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] code
      # Code used for additional data that may be required to identify the note.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] src
      # Source of this note, especially useful when auto-generated.
      # @return [GOBL::CBC::Key]
      property :src, GOBL::CBC::Key

      # @!attribute [r] text
      # The contents of the note
      # @return [String]
      property :text, String
      validates_presence_of :text

      # @!attribute [r] ext
      # Extension data
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions
    end
  end
end
