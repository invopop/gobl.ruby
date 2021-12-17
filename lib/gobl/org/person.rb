# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Person < Model::Struct
      # Unique identity code
      attribute :uuid, Model::Types::String.optional

      # Complete details on the name of the person
      attribute :name, GOBL::Org::Name

      # What they do within an organization
      attribute :role, Model::Types::String.optional

      # Electronic mail addresses that belong to the person.
      attribute :emails, Model::Types::Array(GOBL::Org::Email).optional

      # Data about the data.
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
