# frozen_string_literal: true

module GOBL
  module Org
    class Coordinates < Dynamic::Base
      attribute :lat, Dynamic::Types::Double.optional
      attribute :lon, Dynamic::Types::Double.optional
      attribute :w3w, Dynamic::Types::String.optional
      attribute :geohash, Dynamic::Types::String.optional

      def self.refs
        @refs ||= {
          'lat' => nil,
          'lon' => nil,
          'w3w' => nil,
          'geohash' => nil
        }
      end
    end
  end
end
