# frozen_string_literal: true

module GOBL
  module Pay
    class URL < Dynamic::Base
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :addr, Dynamic::Types::String
      attribute :notes, Dynamic::Types::String.optional
      attribute :meta, Dynamic::Types::Hash.optional

      def self.refs
        @refs ||= {
          'uuid' => GOBL::UUID::UUID,
          'addr' => nil,
          'notes' => nil,
          'meta' => nil
        }
      end
    end
  end
end
