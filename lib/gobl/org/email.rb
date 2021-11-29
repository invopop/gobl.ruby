# frozen_string_literal: true

module GOBL
  module Org
    class Email < Dynamic::Base
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :label, Dynamic::Types::String.optional
      attribute :addr, Dynamic::Types::String
      attribute :meta, Dynamic::Types::Hash.optional

      def self.refs
        @refs ||= {
          'uuid' => GOBL::UUID::UUID,
          'label' => nil,
          'addr' => nil,
          'meta' => nil
        }
      end
    end
  end
end
