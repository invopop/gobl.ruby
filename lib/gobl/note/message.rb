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
      # Summary of the message content
      attribute? :title, GOBL::Types::String.optional

      # Details of what exactly this message wants to communicate
      attribute :content, GOBL::Types::String

      # Any additional semi-structured data that might be useful.
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

