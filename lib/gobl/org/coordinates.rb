# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Coordinates < Dynamic::Struct
      attribute :lat, Dynamic::Types::Double.optional
      attribute :lon, Dynamic::Types::Double.optional
      attribute :w3w, Dynamic::Types::String.optional
      attribute :geohash, Dynamic::Types::String.optional

      def self.properties_ref
        @properties_ref ||= {
          'lat' => nil,
          'lon' => nil,
          'w3w' => nil,
          'geohash' => nil
        }
      end
    end
  end
end
