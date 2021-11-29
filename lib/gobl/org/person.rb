# frozen_string_literal: true

module GOBL
  module Org
    class Person < Dynamic::Base
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :name, GOBL::Org::Name
      attribute :role, Dynamic::Types::String.optional
      attribute :emails, Dynamic::Types::Array(GOBL::Org::Email).optional
      attribute :meta, Dynamic::Types::Hash.optional

      def self.refs
        @refs ||= {
          'uuid' => GOBL::UUID::UUID,
          'name' => GOBL::Org::Name,
          'role' => nil,
          'emails' => GOBL::Org::Email,
          'meta' => nil
        }
      end
    end
  end
end
