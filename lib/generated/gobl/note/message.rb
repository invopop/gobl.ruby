# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.54.0
##

module GOBL
  module Note
    # Message represents a simple message object with a title and some content meant.
    class Message < GOBL::Object
      # The Schema ID of the GOBL Message structure
      SCHEMA_ID = 'https://gobl.org/draft-0/note/message'

      # @!attribute [r] title
      # Summary of the message content
      # @return [String]
      property :title, String

      # @!attribute [r] content
      # Details of what exactly this message wants to communicate.
      # @return [String]
      property :content, String
      validates_presence_of :content

      # @!attribute [r] meta
      # Any additional semi-structured data that might be useful.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
