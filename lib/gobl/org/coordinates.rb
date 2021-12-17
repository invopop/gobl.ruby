# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

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
    end
  end
end
