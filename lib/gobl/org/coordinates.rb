# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Coordinates describes an exact geographical location in the world.
    class Coordinates < GOBL::Struct
      # Decimal latitude coordinate.
      attribute? :lat, GOBL::Types::Double.optional

      # Decimal longitude coordinate.
      attribute? :lon, GOBL::Types::Double.optional

      # Text coordinates compose of three words.
      attribute? :w3w, GOBL::Types::String.optional

      # Single string coordinate based on geohash standard.
      attribute? :geohash, GOBL::Types::String.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          lat: data['lat'],
          lon: data['lon'],
          w3w: data['w3w'],
          geohash: data['geohash']
        )
      end

      def to_gobl
        {
          'lat' => attributes[:lat],
          'lon' => attributes[:lon],
          'w3w' => attributes[:w3w],
          'geohash' => attributes[:geohash]
        }
      end
    end
  end
end

