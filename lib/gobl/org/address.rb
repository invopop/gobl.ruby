# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class Address < Model::Struct
      attribute :uuid, Model::Types::String.optional

      # Useful identifier
      attribute :label, Model::Types::String.optional

      # Box number or code for the post office box located at the address.
      attribute :po_box, Model::Types::String.optional

      # House or building number in the street.
      attribute :num, Model::Types::String.optional

      # Floor number within the building.
      attribute :floor, Model::Types::String.optional

      # Block number within the building.
      attribute :block, Model::Types::String.optional

      # Door number within the building.
      attribute :door, Model::Types::String.optional

      # Fist line of street.
      attribute :street, Model::Types::String.optional

      # Additional street address details.
      attribute :street_extra, Model::Types::String.optional

      # The village
      attribute :locality, Model::Types::String

      # Province
      attribute :region, Model::Types::String

      # Post or ZIP code.
      attribute :code, Model::Types::String.optional

      # ISO country code.
      attribute :country, Model::Types::String.optional

      # For when the postal address is not sufficient
      attribute :coords, GOBL::Org::Coordinates.optional

      attribute :meta, Model::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
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
          meta: gobl['meta']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
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
          'coords' => attributes[:coords],
          'meta' => attributes[:meta]
        }
      end
    end
  end
end
