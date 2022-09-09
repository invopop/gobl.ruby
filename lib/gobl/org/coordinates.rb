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
        }.compact
      end
    end
  end
end

