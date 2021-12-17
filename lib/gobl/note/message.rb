# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Note
    class Message < Model::Struct
      # Summary of the message content.
      attribute :title, Model::Types::String.optional

      # Details of what exactly this message wants to communicate.
      attribute :content, Model::Types::String

      # Any additional semi-structured data that might be useful.
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
