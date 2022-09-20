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
      # The Schema ID of the GOBL Note structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/notes#/$defs/Note'

      # @!attribute [r] key
      # Key specifying subject of the text
      # @return [NoteKey]
      attribute? :key, NoteKey.optional

      # @!attribute [r] code
      # Code used for additional data that may be required to identify the note.
      # @return [String]
      attribute? :code, GOBL::Types::String.optional

      # @!attribute [r] src
      # Source of this note, especially useful when auto-generated.
      # @return [String]
      attribute? :src, GOBL::Types::String.optional

      # @!attribute [r] text
      # The contents of the note
      # @return [String]
      attribute :text, GOBL::Types::String

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Note] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          key: data['key'] ? NoteKey.from_gobl!(data['key']) : nil,
          code: data['code'],
          src: data['src'],
          text: data['text']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'key' => attributes[:key]&.to_gobl,
          'code' => attributes[:code],
          'src' => attributes[:src],
          'text' => attributes[:text]
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Note} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Note] the object corresponding to the given input
    end
  end
end

