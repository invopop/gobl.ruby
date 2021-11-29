# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Note
    class Message < Dynamic::Struct
      attribute :title, Dynamic::Types::String.optional
      attribute :content, Dynamic::Types::String
      attribute :meta, Dynamic::Types::Hash.optional

      def self.properties_ref
        @properties_ref ||= {
          'title' => nil,
          'content' => nil,
          'meta' => nil
        }
      end
    end
  end
end
