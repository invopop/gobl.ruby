# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Dsig
    class Digest < Dynamic::Struct
      attribute :alg, Dynamic::Types::String
      attribute :val, Dynamic::Types::String

      def self.properties_ref
        @properties_ref ||= {
          'alg' => nil,
          'val' => nil
        }
      end
    end
  end
end
