# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Line < Model::Struct
      attribute :uuid, Model::Types::String.optional

      # Line number inside the invoice.
      attribute :i, Model::Types::Int

      attribute :quantity, Model::Types::String

      attribute :item, GOBL::Org::Item

      # Result of quantity multiplied by item price
      attribute :sum, Model::Types::String

      # Discount applied to this line.
      attribute :discount, GOBL::Org::Discount.optional

      # List of taxes to be applied to the line in the invoice totals.
      attribute :taxes, Model::Types::Array(GOBL::Tax::Rate).optional

      # Total line amount after applying discounts to the sum.
      attribute :total, Model::Types::String
    end
  end
end
