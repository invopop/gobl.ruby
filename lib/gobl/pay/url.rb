# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Pay
    class URL < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :addr, Model::Types::String
      attribute :notes, Model::Types::String.optional
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
