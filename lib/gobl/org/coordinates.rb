# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##

module GOBL
  module Org
    # Coordinates describes an exact geographical location in the world.
    class Coordinates < GOBL::Struct
      # The Schema ID of the GOBL Coordinates structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/coordinates'

      # @!attribute [r] lat
      # Decimal latitude coordinate.
      # @return [Float]
      attribute? :lat, GOBL::Types::Double.optional

      # @!attribute [r] lon
      # Decimal longitude coordinate.
      # @return [Float]
      attribute? :lon, GOBL::Types::Double.optional

      # @!attribute [r] w3w
      # Text coordinates compose of three words.
      # @return [String]
      attribute? :w3w, GOBL::Types::String.optional

      # @!attribute [r] geohash
      # Single string coordinate based on geohash standard.
      # @return [String]
      attribute? :geohash, GOBL::Types::String.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Coordinates] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          lat: data['lat'],
          lon: data['lon'],
          w3w: data['w3w'],
          geohash: data['geohash']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'lat' => attributes[:lat],
          'lon' => attributes[:lon],
          'w3w' => attributes[:w3w],
          'geohash' => attributes[:geohash]
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Coordinates} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   The `new` method will only allow to create a new object if all attributes
      #   marked as mandatory and not calculated in the JSON schema are provided.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Coordinates] the object corresponding to the given input
    end
  end
end
