# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Name < Model::Struct
      # Unique identity code
      attribute :uuid, Model::Types::String.optional

      # What the person would like to be called
      attribute :alias, Model::Types::String.optional

      attribute :prefix, Model::Types::String.optional

      # The person's given name
      attribute :given, Model::Types::String

      # Middle names or initials
      attribute :middle, Model::Types::String.optional

      attribute :surname, Model::Types::String

      attribute :surname2, Model::Types::String.optional

      attribute :suffix, Model::Types::String.optional

      attribute :meta, Model::Types::Hash.optional
    end
  end
end
