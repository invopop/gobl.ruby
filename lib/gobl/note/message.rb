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

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          title: data['title'],
          content: data['content'],
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      def to_gobl
        {
          'title' => attributes[:title],
          'content' => attributes[:content],
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end
    end
  end
end

