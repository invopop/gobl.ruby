# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class TaxID < Dynamic::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :country, Dynamic::Types::String
      attribute :code, Dynamic::Types::String
      attribute :meta, Dynamic::Types::Hash.optional

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
