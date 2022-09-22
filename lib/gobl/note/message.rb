# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##


module GOBL
  module Note
    # Message represents the minimum possible contents for a GoBL document type.
    class Message < GOBL::Struct
      # The Schema ID of the GOBL Message structure
      SCHEMA_ID = 'https://gobl.org/draft-0/note/message'

      # @!attribute [r] title
      # Summary of the message content
      # @return [String]
      attribute? :title, GOBL::Types::String.optional

      # @!attribute [r] content
      # Details of what exactly this message wants to communicate
      # @return [String]
      attribute :content, GOBL::Types::String

      # @!attribute [r] meta
      # Any additional semi-structured data that might be useful.
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Message] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          title: data['title'],
          content: data['content'],
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'title' => attributes[:title],
          'content' => attributes[:content],
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Message} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Message] the object corresponding to the given input
    end
  end
end

