# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Email < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :label, Model::Types::String.optional
      attribute :addr, Model::Types::String
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
