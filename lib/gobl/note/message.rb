# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Note
    class Message < Model::Struct
      # Summary of the message content.
      attribute :title, Model::Types::String.optional

      # Details of what exactly this message wants to communicate.
      attribute :content, Model::Types::String

      # Any additional semi-structured data that might be useful.
      attribute :meta, Model::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          title: gobl['title'],
          content: gobl['content'],
          meta: gobl['meta']
        )
      end

      def to_gobl
        {
          'title' => attributes[:title],
          'content' => attributes[:content],
          'meta' => attributes[:meta]
        }
      end
    end
  end
end
