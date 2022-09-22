# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Org
    # Address defines a globally acceptable set of attributes that describes a postal or fiscal address.
    class Address < GOBL::Struct
      # The Schema ID of the GOBL Address structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/address'

      # @!attribute [r] uuid
      # Internal ID used to identify the party inside a document.
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] label
      # Useful identifier, such as home, work, etc.
      # @return [String]
      attribute? :label, GOBL::Types::String.optional

      # @!attribute [r] po_box
      # Box number or code for the post office box located at the address.
      # @return [String]
      attribute? :po_box, GOBL::Types::String.optional

      # @!attribute [r] num
      # House or building number in the street.
      # @return [String]
      attribute? :num, GOBL::Types::String.optional

      # @!attribute [r] floor
      # Floor number within the building.
      # @return [String]
      attribute? :floor, GOBL::Types::String.optional

      # @!attribute [r] block
      # Block number within the building.
      # @return [String]
      attribute? :block, GOBL::Types::String.optional

      # @!attribute [r] door
      # Door number within the building.
      # @return [String]
      attribute? :door, GOBL::Types::String.optional

      # @!attribute [r] street
      # First line of street.
      # @return [String]
      attribute? :street, GOBL::Types::String.optional

      # @!attribute [r] street_extra
      # Additional street address details.
      # @return [String]
      attribute? :street_extra, GOBL::Types::String.optional

      # @!attribute [r] locality
      # The village, town, district, or city.
      # @return [String]
      attribute :locality, GOBL::Types::String

      # @!attribute [r] region
      # Province, County, or State.
      # @return [String]
      attribute :region, GOBL::Types::String

      # @!attribute [r] code
      # Post or ZIP code.
      # @return [String]
      attribute? :code, GOBL::Types::String.optional

      # @!attribute [r] country
      # ISO country code.
      # @return [GOBL::L10n::CountryCode]
      attribute? :country, GOBL::L10n::CountryCode.optional

      # @!attribute [r] coords
      # When the postal address is not sufficient, coordinates help locate the address more precisely.
      # @return [GOBL::Org::Coordinates]
      attribute? :coords, GOBL::Org::Coordinates.optional

      # @!attribute [r] meta
      # Any additional semi-structure details about the address.
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Address] the object created from the given data
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
          country: data['country'] ? GOBL::L10n::CountryCode.from_gobl!(data['country']) : nil,
          coords: data['coords'] ? GOBL::Org::Coordinates.from_gobl!(data['coords']) : nil,
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
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
          'country' => attributes[:country]&.to_gobl,
          'coords' => attributes[:coords]&.to_gobl,
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Address} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Address] the object corresponding to the given input
    end
  end
end

