# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Telephone < Model::Struct
      attribute :uuid, Model::Types::String.optional

      # Identifier for this number.
      attribute :label, Model::Types::String.optional

      # The number to be dialed in ITU E.164 international format.
      attribute :num, Model::Types::String
    end
  end
end
