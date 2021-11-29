# frozen_string_literal: true

module GOBL
  module Dsig
    class Digest < Dynamic::Base
      attribute :alg, Dynamic::Types::String
      attribute :val, Dynamic::Types::String

      def self.refs
        @refs ||= {
          'alg' => nil,
          'val' => nil
        }
      end
    end
  end
end
