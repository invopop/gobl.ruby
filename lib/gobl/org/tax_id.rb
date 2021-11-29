# frozen_string_literal: true

module GOBL
  module Org
    class TaxID < Dynamic::Base
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :country, Dynamic::Types::String
      attribute :code, Dynamic::Types::String
      attribute :meta, Dynamic::Types::Hash.optional

      def self.refs
        @refs ||= {
          'uuid' => GOBL::UUID::UUID,
          'country' => nil,
          'code' => nil,
          'meta' => nil
        }
      end
    end
  end
end
