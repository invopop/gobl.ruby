# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class TaxID < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :country, Model::Types::String
      attribute :code, Model::Types::String
      attribute :meta, Model::Types::Hash.optional

      def self.properties_ref
        @properties_ref ||= {
          'uuid' => GOBL::UUID::UUID,
          'country' => nil,
          'code' => nil,
          'meta' => nil
        }
      end
    end
  end
end
