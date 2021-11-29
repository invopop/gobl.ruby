# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Line < Dynamic::Struct
      attribute :uuid, Dynamic::Types::String.optional
      attribute :i, Dynamic::Types::Int
      attribute :quantity, GOBL::Num::Amount
      attribute :item, GOBL::Org::Item
      attribute :sum, GOBL::Num::Amount
      attribute :discount, GOBL::Org::Discount.optional
      attribute :taxes, Dynamic::Types::Array(GOBL::Tax::Rate).optional
      attribute :total, GOBL::Num::Amount

      def self.properties_ref
        @properties_ref ||= {
          'uuid' => nil,
          'i' => nil,
          'quantity' => GOBL::Num::Amount,
          'item' => GOBL::Org::Item,
          'sum' => GOBL::Num::Amount,
          'discount' => GOBL::Org::Discount,
          'taxes' => GOBL::Tax::Rate,
          'total' => GOBL::Num::Amount
        }
      end
    end
  end
end
