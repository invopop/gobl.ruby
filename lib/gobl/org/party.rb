# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class Party < Model::Struct
      # Unique identity code.
      attribute :uuid, GOBL::UUID::UUID.optional

      # The entity's legal ID code used for tax purposes. They may have other numbers
      attribute :tax_id, GOBL::Org::TaxID.optional

      # Legal name or representation of the organization.
      attribute :name, Model::Types::String

      # Alternate short name.
      attribute :alias, Model::Types::String.optional

      # Details of physical people who represent the party.
      attribute :people, Model::Types::Array(GOBL::Org::Person).optional

      # Regular post addresses for where information should be sent if needed.
      attribute :addresses, Model::Types::Array(GOBL::Org::Address).optional

      attribute :emails, Model::Types::Array(GOBL::Org::Email).optional

      attribute :telephones, Model::Types::Array(GOBL::Org::Telephone).optional

      # Any additional non-structure information that does not fit into the rest of the document.
      attribute :meta, Model::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          tax_id: gobl['tax_id'] ? GOBL::Org::TaxID.from_gobl!(gobl['tax_id']) : nil,
          name: gobl['name'],
          alias: gobl['alias'],
          people: gobl['people']&.map { |x| GOBL::Org::Person.from_gobl!(x) },
          addresses: gobl['addresses']&.map { |x| GOBL::Org::Address.from_gobl!(x) },
          emails: gobl['emails']&.map { |x| GOBL::Org::Email.from_gobl!(x) },
          telephones: gobl['telephones']&.map { |x| GOBL::Org::Telephone.from_gobl!(x) },
          meta: gobl['meta']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'tax_id' => attributes[:tax_id]&.to_gobl,
          'name' => attributes[:name],
          'alias' => attributes[:alias],
          'people' => attributes[:people]&.map { |x| x&.to_gobl },
          'addresses' => attributes[:addresses]&.map { |x| x&.to_gobl },
          'emails' => attributes[:emails]&.map { |x| x&.to_gobl },
          'telephones' => attributes[:telephones]&.map { |x| x&.to_gobl },
          'meta' => attributes[:meta]
        }
      end
    end
  end
end
