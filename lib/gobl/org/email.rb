# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Email < Dynamic::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :label, Dynamic::Types::String.optional
      attribute :addr, Dynamic::Types::String
      attribute :meta, Dynamic::Types::Hash.optional

      def self.properties_ref
        @properties_ref ||= {
          'uuid' => GOBL::UUID::UUID,
          'label' => nil,
          'addr' => nil,
          'meta' => nil
        }
      end
    end
  end
end
