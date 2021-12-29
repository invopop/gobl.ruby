# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Org
    class Address < Dry::Struct
      attribute :uuid, GOBL::UUID::UUID.optional

      # Useful identifier
      attribute :label, GOBL::Types::String.optional

      # Box number or code for the post office box located at the address.
      attribute :po_box, GOBL::Types::String.optional

      # House or building number in the street.
      attribute :num, GOBL::Types::String.optional

      # Floor number within the building.
      attribute :floor, GOBL::Types::String.optional

      # Block number within the building.
      attribute :block, GOBL::Types::String.optional

      # Door number within the building.
      attribute :door, GOBL::Types::String.optional

      # Fist line of street.
      attribute :street, GOBL::Types::String.optional

      # Additional street address details.
      attribute :street_extra, GOBL::Types::String.optional

      # The village
      attribute :locality, GOBL::Types::String

      # Province
      attribute :region, GOBL::Types::String

      # Post or ZIP code.
      attribute :code, GOBL::Types::String.optional

      # ISO country code.
      attribute :country, GOBL::Types::String.optional

      # For when the postal address is not sufficient
      attribute :coords, GOBL::Org::Coordinates.optional

      attribute :address_meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          label: gobl['label'],
          po_box: gobl['po_box'],
          num: gobl['num'],
          floor: gobl['floor'],
          block: gobl['block'],
          door: gobl['door'],
          street: gobl['street'],
          street_extra: gobl['street_extra'],
          locality: gobl['locality'],
          region: gobl['region'],
          code: gobl['code'],
          country: gobl['country'],
          coords: gobl['coords'] ? GOBL::Org::Coordinates.from_gobl!(gobl['coords']) : nil,
          address_meta: gobl['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'label' => attributes[:label],
          'po_box' => attributes[:po_box],
          'num' => attributes[:num],
          'floor' => attributes[:floor],
          'block' => attributes[:block],
          'door' => attributes[:door],
          'street' => attributes[:street],
          'street_extra' => attributes[:street_extra],
          'locality' => attributes[:locality],
          'region' => attributes[:region],
          'code' => attributes[:code],
          'country' => attributes[:country],
          'coords' => attributes[:coords]&.to_gobl,
          'meta' => attributes[:address_meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
