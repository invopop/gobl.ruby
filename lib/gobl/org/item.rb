# frozen_string_literal: true

module GOBL
  module Org
    class Item < Dynamic::Base
      attribute :uuid, Dynamic::Types::String.optional
      attribute :name, Dynamic::Types::String
      attribute :desc, Dynamic::Types::String.optional
      attribute :currency, Dynamic::Types::String.optional
      attribute :price, GOBL::Num::Amount
      attribute :unit, Dynamic::Types::String.optional
      attribute :supplier_ids, Dynamic::Types::Array(GOBL::Org::ItemID).optional
      attribute :origin, Dynamic::Types::String.optional
      attribute :meta, Dynamic::Types::Hash.optional

      def self.refs
        @refs ||= {
          'uuid' => nil,
          'name' => nil,
          'desc' => nil,
          'currency' => nil,
          'price' => GOBL::Num::Amount,
          'unit' => nil,
          'supplier_ids' => GOBL::Org::ItemID,
          'origin' => nil,
          'meta' => nil
        }
      end
    end
  end
end
