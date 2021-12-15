# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Line < Model::Struct
      attribute :uuid, Model::Types::String.optional
      attribute :i, Model::Types::Int
      attribute :quantity, GOBL::Num::Amount
      attribute :item, GOBL::Org::Item
      attribute :sum, GOBL::Num::Amount
      attribute :discount, GOBL::Org::Discount.optional
      attribute :taxes, Model::Types::Array(GOBL::Tax::Rate).optional
      attribute :total, GOBL::Num::Amount
    end
  end
end
