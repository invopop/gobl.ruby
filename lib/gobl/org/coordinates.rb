# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class Coordinates < Model::Struct
      # Decimal latitude coordinate.
      attribute :lat, Model::Types::Double.optional

      # Decimal longitude coordinate.
      attribute :lon, Model::Types::Double.optional

      # Text coordinates compose of three words.
      attribute :w3w, Model::Types::String.optional

      # Single string coordinate based on geohash standard.
      attribute :geohash, Model::Types::String.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          lat: gobl['lat'],
          lon: gobl['lon'],
          w3w: gobl['w3w'],
          geohash: gobl['geohash']
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
