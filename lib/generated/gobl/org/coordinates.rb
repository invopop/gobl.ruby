# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.42.4
##

module GOBL
  module Org
    # Coordinates describes an exact geographical location in the world.
    class Coordinates < GOBL::Object
      # The Schema ID of the GOBL Coordinates structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/coordinates'

      # @!attribute [r] lat
      # Decimal latitude coordinate.
      # @return [Float]
      property :lat, Float

      # @!attribute [r] lon
      # Decimal longitude coordinate.
      # @return [Float]
      property :lon, Float

      # @!attribute [r] w3w
      # Text coordinates compose of three words.
      # @return [String]
      property :w3w, String

      # @!attribute [r] geohash
      # Single string coordinate based on geohash standard.
      # @return [String]
      property :geohash, String
    end
  end
end
