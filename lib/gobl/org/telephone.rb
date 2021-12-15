# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Telephone < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :label, Model::Types::String.optional
      attribute :num, Model::Types::String
    end
  end
end
