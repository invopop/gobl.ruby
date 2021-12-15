# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Person < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :name, GOBL::Org::Name
      attribute :role, Model::Types::String.optional
      attribute :emails, Model::Types::Array(GOBL::Org::Email).optional
      attribute :meta, Model::Types::Hash.optional

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
