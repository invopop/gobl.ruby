# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Note represents a free text of additional information that may be added to a document.
    class Note < GOBL::Struct
      # Key specifying subject of the text
      attribute? :key, NoteKey.optional

      # Code used for additional data that may be required to identify the note.
      attribute? :code, GOBL::Types::String.optional

      # Source of this note, especially useful when auto-generated.
      attribute? :src, GOBL::Types::String.optional

      # The contents of the note
      attribute :text, GOBL::Types::String

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          key: data['key'] ? NoteKey.from_gobl!(data['key']) : nil,
          code: data['code'],
          src: data['src'],
          text: data['text']
        )
      end

      def to_gobl
        {
          'key' => attributes[:key]&.to_gobl,
          'code' => attributes[:code],
          'src' => attributes[:src],
          'text' => attributes[:text]
        }
      end
    end
  end
end

