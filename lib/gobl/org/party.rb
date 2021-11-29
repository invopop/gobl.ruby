# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Party < Dynamic::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :tax_id, GOBL::Org::TaxID.optional
      attribute :name, Dynamic::Types::String
      attribute :alias, Dynamic::Types::String.optional
      attribute :people, Dynamic::Types::Array(GOBL::Org::Person).optional
      attribute :addresses, Dynamic::Types::Array(GOBL::Org::Address).optional
      attribute :emails, Dynamic::Types::Array(GOBL::Org::Email).optional
      attribute :telephones, Dynamic::Types::Array(GOBL::Org::Telephone).optional
      attribute :meta, Dynamic::Types::Hash.optional

      def self.properties_ref
        @properties_ref ||= {
          'uuid' => GOBL::UUID::UUID,
          'tax_id' => GOBL::Org::TaxID,
          'name' => nil,
          'alias' => nil,
          'people' => GOBL::Org::Person,
          'addresses' => GOBL::Org::Address,
          'emails' => GOBL::Org::Email,
          'telephones' => GOBL::Org::Telephone,
          'meta' => nil
        }
      end
    end
  end
end
