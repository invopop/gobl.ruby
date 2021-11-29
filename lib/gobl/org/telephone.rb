# frozen_string_literal: true

module GOBL
  module Org
    class Telephone < Dynamic::Base
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :label, Dynamic::Types::String.optional
      attribute :num, Dynamic::Types::String

      def self.refs
        @refs ||= {
          'uuid' => GOBL::UUID::UUID,
          'label' => nil,
          'num' => nil
        }
      end
    end
  end
end
