# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Email < Model::Struct
      attribute :uuid, Model::Types::String.optional

      # Identifier for the email.
      attribute :label, Model::Types::String.optional

      # Electronic mailing address.
      attribute :addr, Model::Types::String

      # Additional fields.
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
