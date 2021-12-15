# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Line < Model::Struct
      attribute :uuid, Model::Types::String.optional
      attribute :i, Model::Types::Int
      attribute :quantity, Model::Types::String
      attribute :item, GOBL::Org::Item
      attribute :sum, Model::Types::String
      attribute :discount, GOBL::Org::Discount.optional
      attribute :taxes, Model::Types::Array(GOBL::Tax::Rate).optional
      attribute :total, Model::Types::String
    end
  end
end
