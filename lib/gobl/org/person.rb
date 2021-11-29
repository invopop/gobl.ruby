# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Person < Dynamic::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :name, GOBL::Org::Name
      attribute :role, Dynamic::Types::String.optional
      attribute :emails, Dynamic::Types::Array(GOBL::Org::Email).optional
      attribute :meta, Dynamic::Types::Hash.optional

      def self.properties_ref
        @properties_ref ||= {
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
