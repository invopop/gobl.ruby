# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Org
    class Party < Dry::Struct
      # Internal ID used to identify the party inside a document.
      attribute :id, GOBL::Types::String.optional

      # Unique identity code.
      attribute :uuid, GOBL::UUID::UUID.optional

      # The entity's legal ID code used for tax purposes. They may have other numbers
      attribute :tax_id, GOBL::Org::TaxID.optional

      # Legal name or representation of the organization.
      attribute :name, GOBL::Types::String

      # Alternate short name.
      attribute :alias, GOBL::Types::String.optional

      # Details of physical people who represent the party.
      attribute :people, GOBL::Types::Array(GOBL::Org::Person).optional

      # Regular post addresses for where information should be sent if needed.
      attribute :addresses, GOBL::Types::Array(GOBL::Org::Address).optional

      attribute :emails, GOBL::Types::Array(GOBL::Org::Email).optional

      attribute :telephones, GOBL::Types::Array(GOBL::Org::Telephone).optional

      # Additional registration details about the company that may need to be included in a document.
      attribute :registration, GOBL::Org::Registration.optional

      # Any additional semi-structured information that does not fit into the rest of the party.
      attribute :party_meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          id: gobl['id'],
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          tax_id: gobl['tax_id'] ? GOBL::Org::TaxID.from_gobl!(gobl['tax_id']) : nil,
          name: gobl['name'],
          alias: gobl['alias'],
          people: gobl['people']&.map { |x| GOBL::Org::Person.from_gobl!(x) },
          addresses: gobl['addresses']&.map { |x| GOBL::Org::Address.from_gobl!(x) },
          emails: gobl['emails']&.map { |x| GOBL::Org::Email.from_gobl!(x) },
          telephones: gobl['telephones']&.map { |x| GOBL::Org::Telephone.from_gobl!(x) },
          registration: gobl['registration'] ? GOBL::Org::Registration.from_gobl!(gobl['registration']) : nil,
          party_meta: gobl['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'id' => attributes[:id],
          'uuid' => attributes[:uuid]&.to_gobl,
          'tax_id' => attributes[:tax_id]&.to_gobl,
          'name' => attributes[:name],
          'alias' => attributes[:alias],
          'people' => attributes[:people]&.map { |x| x&.to_gobl },
          'addresses' => attributes[:addresses]&.map { |x| x&.to_gobl },
          'emails' => attributes[:emails]&.map { |x| x&.to_gobl },
          'telephones' => attributes[:telephones]&.map { |x| x&.to_gobl },
          'registration' => attributes[:registration]&.to_gobl,
          'meta' => attributes[:party_meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
