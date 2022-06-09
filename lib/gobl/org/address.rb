# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.24.0
##

require 'dry-struct'

module GOBL
  module Org
    # Address defines a globally acceptable set of attributes that describes a postal or fiscal address.
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

      attribute :meta, GOBL::Org::Meta.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          label: data['label'],
          po_box: data['po_box'],
          num: data['num'],
          floor: data['floor'],
          block: data['block'],
          door: data['door'],
          street: data['street'],
          street_extra: data['street_extra'],
          locality: data['locality'],
          region: data['region'],
          code: data['code'],
          country: data['country'],
          coords: data['coords'] ? GOBL::Org::Coordinates.from_gobl!(data['coords']) : nil,
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
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
          'meta' => attributes[:meta]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

