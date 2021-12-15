# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Dsig
    class Digest < Model::Struct
      attribute :alg, Model::Types::String
      attribute :val, Model::Types::String

      def self.properties_ref
        @properties_ref ||= {
          'alg' => nil,
          'val' => nil
        }
      end
    end
  end
end
