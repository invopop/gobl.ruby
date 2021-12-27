# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Note
    class Message < GOBL::Struct
      # Summary of the message content.
      attribute :title, GOBL::Types::String.optional

      # Details of what exactly this message wants to communicate.
      attribute :content, GOBL::Types::String

      # Any additional semi-structured data that might be useful.
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          title: gobl['title'],
          content: gobl['content'],
          meta: gobl['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'title' => attributes[:title],
          'content' => attributes[:content],
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
