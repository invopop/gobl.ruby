# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.29.0
##

require 'dry-struct'

module GOBL
  module Org
    # Party represents a person or business entity.
    class Party < Dry::Struct
      # Internal ID used to identify the party inside a document.
      attribute :id, GOBL::Types::String.optional

      # Unique identity code
      attribute :uuid, GOBL::UUID::UUID.optional

      # The entity's legal ID code used for tax purposes. They may have other numbers, but we're only interested in those valid for tax purposes.
      attribute :tax_id, GOBL::Org::TaxIdentity.optional

      # Legal name or representation of the organization.
      attribute :name, GOBL::Types::String

      # Alternate short name.
      attribute :alias, GOBL::Types::String.optional

      # Details of physical people who represent the party.
      attribute :people, GOBL::Types::Array.of(GOBL::Org::Person).optional

      # Digital inboxes used for forwarding electronic versions of documents
      attribute :inboxes, GOBL::Types::Array.of(GOBL::Org::Inbox).optional

      # Regular post addresses for where information should be sent if needed.
      attribute :addresses, GOBL::Types::Array.of(GOBL::Org::Address).optional

      # Electronic mail addresses
      attribute :emails, GOBL::Types::Array.of(GOBL::Org::Email).optional

      # Regular telephone numbers
      attribute :telephones, GOBL::Types::Array.of(GOBL::Org::Telephone).optional

      # Additional registration details about the company that may need to be included in a document.
      attribute :registration, GOBL::Org::Registration.optional

      # Any additional semi-structured information that does not fit into the rest of the party.
      attribute :meta, GOBL::Org::Meta.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          id: data['id'],
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          tax_id: data['tax_id'] ? GOBL::Org::TaxIdentity.from_gobl!(data['tax_id']) : nil,
          name: data['name'],
          alias: data['alias'],
          people: data['people']&.map { |item| GOBL::Org::Person.from_gobl!(item) },
          inboxes: data['inboxes']&.map { |item| GOBL::Org::Inbox.from_gobl!(item) },
          addresses: data['addresses']&.map { |item| GOBL::Org::Address.from_gobl!(item) },
          emails: data['emails']&.map { |item| GOBL::Org::Email.from_gobl!(item) },
          telephones: data['telephones']&.map { |item| GOBL::Org::Telephone.from_gobl!(item) },
          registration: data['registration'] ? GOBL::Org::Registration.from_gobl!(data['registration']) : nil,
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
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
          'people' => attributes[:people]&.map { |item| item&.to_gobl },
          'inboxes' => attributes[:inboxes]&.map { |item| item&.to_gobl },
          'addresses' => attributes[:addresses]&.map { |item| item&.to_gobl },
          'emails' => attributes[:emails]&.map { |item| item&.to_gobl },
          'telephones' => attributes[:telephones]&.map { |item| item&.to_gobl },
          'registration' => attributes[:registration]&.to_gobl,
          'meta' => attributes[:meta]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

