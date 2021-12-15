# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Pay
    class URL < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :addr, Model::Types::String
      attribute :notes, Model::Types::String.optional
      attribute :meta, Model::Types::Hash.optional

      def self.properties_ref
        @properties_ref ||= {
          'uuid' => GOBL::UUID::UUID,
          'addr' => nil,
          'notes' => nil,
          'meta' => nil
        }
      end
    end
  end
end
