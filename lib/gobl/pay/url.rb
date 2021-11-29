# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Pay
    class URL < Dynamic::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :addr, Dynamic::Types::String
      attribute :notes, Dynamic::Types::String.optional
      attribute :meta, Dynamic::Types::Hash.optional

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
