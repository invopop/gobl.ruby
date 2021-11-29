# frozen_string_literal: true

module GOBL
  module Org
    class Address < Dynamic::Base
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :label, Dynamic::Types::String.optional
      attribute :po_box, Dynamic::Types::String.optional
      attribute :num, Dynamic::Types::String.optional
      attribute :floor, Dynamic::Types::String.optional
      attribute :block, Dynamic::Types::String.optional
      attribute :door, Dynamic::Types::String.optional
      attribute :street, Dynamic::Types::String.optional
      attribute :street_extra, Dynamic::Types::String.optional
      attribute :locality, Dynamic::Types::String
      attribute :region, Dynamic::Types::String
      attribute :code, Dynamic::Types::String.optional
      attribute :country, Dynamic::Types::String.optional
      attribute :coords, GOBL::Org::Coordinates.optional
      attribute :meta, Dynamic::Types::Hash.optional

      def self.refs
        @refs ||= {
          'uuid' => GOBL::UUID::UUID,
          'label' => nil,
          'po_box' => nil,
          'num' => nil,
          'floor' => nil,
          'block' => nil,
          'door' => nil,
          'street' => nil,
          'street_extra' => nil,
          'locality' => nil,
          'region' => nil,
          'code' => nil,
          'country' => nil,
          'coords' => GOBL::Org::Coordinates,
          'meta' => nil
        }
      end
    end
  end
end
