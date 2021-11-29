# frozen_string_literal: true

module GOBL
  module Note
    class Message < Dynamic::Base
      attribute :title, Dynamic::Types::String.optional
      attribute :content, Dynamic::Types::String
      attribute :meta, Dynamic::Types::Hash.optional

      def self.refs
        @refs ||= {
          'title' => nil,
          'content' => nil,
          'meta' => nil
        }
      end
    end
  end
end
