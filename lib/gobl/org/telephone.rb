# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Telephone < Dynamic::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :label, Dynamic::Types::String.optional
      attribute :num, Dynamic::Types::String

      def self.properties_ref
        @properties_ref ||= {
          'uuid' => GOBL::UUID::UUID,
          'label' => nil,
          'num' => nil
        }
      end
    end
  end
end
