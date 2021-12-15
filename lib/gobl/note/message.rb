# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Note
    class Message < Model::Struct
      attribute :title, Model::Types::String.optional
      attribute :content, Model::Types::String
      attribute :meta, Model::Types::Hash.optional

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
