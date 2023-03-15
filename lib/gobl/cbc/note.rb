# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.38.0
##

module GOBL
  module CBC
    # Note represents a free text of additional information that may be added to a document.
    class Note < GOBL::Object
      # The Schema ID of the GOBL Note structure
      SCHEMA_ID = 'https://gobl.org/draft-0/cbc/note'

      # @!attribute [r] key
      # Key specifying subject of the text
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] code
      # Code used for additional data that may be required to identify the note.
      # @return [String]
      property :code, String

      # @!attribute [r] src
      # Source of this note, especially useful when auto-generated.
      # @return [GOBL::CBC::Key]
      property :src, GOBL::CBC::Key

      # @!attribute [r] text
      # The contents of the note
      # @return [String]
      property :text, String
      validates :text, presence: true
    end
  end
end
