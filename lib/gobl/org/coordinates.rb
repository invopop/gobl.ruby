# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Coordinates < Model::Struct
      attribute :lat, Model::Types::Double.optional
      attribute :lon, Model::Types::Double.optional
      attribute :w3w, Model::Types::String.optional
      attribute :geohash, Model::Types::String.optional

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
