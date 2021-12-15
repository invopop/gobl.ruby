# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Outlay < Model::Struct
      attribute :uuid, Model::Types::String.optional
      attribute :i, Model::Types::Int
      attribute :ref, Model::Types::String.optional
      attribute :desc, Model::Types::String
      attribute :paid, GOBL::Num::Amount
    end
  end
end
