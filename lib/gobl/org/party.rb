# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##

module GOBL
  module Org
    # Party represents a person or business entity.
    class Party < GOBL::Struct
      # The Schema ID of the GOBL Party structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/party'

      # @!attribute [r] id
      # Internal ID used to identify the party inside a document.
      # @return [String]
      attribute? :id, GOBL::Types::String.optional

      # @!attribute [r] uuid
      # Unique identity code
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] tax_id
      # The entity's legal ID code used for tax purposes. They may have other numbers, but we're only interested in those valid for tax purposes.
      # @return [GOBL::Org::TaxIdentity]
      attribute? :tax_id, GOBL::Org::TaxIdentity.optional

      # @!attribute [r] name
      # Legal name or representation of the organization.
      # @return [String]
      attribute :name, GOBL::Types::String

      # @!attribute [r] alias
      # Alternate short name.
      # @return [String]
      attribute? :alias, GOBL::Types::String.optional

      # @!attribute [r] people
      # Details of physical people who represent the party.
      # @return [Array<GOBL::Org::Person>]
      attribute? :people, GOBL::Types::Array.of(GOBL::Org::Person).optional

      # @!attribute [r] inboxes
      # Digital inboxes used for forwarding electronic versions of documents
      # @return [Array<GOBL::Org::Inbox>]
      attribute? :inboxes, GOBL::Types::Array.of(GOBL::Org::Inbox).optional

      # @!attribute [r] addresses
      # Regular post addresses for where information should be sent if needed.
      # @return [Array<GOBL::Org::Address>]
      attribute? :addresses, GOBL::Types::Array.of(GOBL::Org::Address).optional

      # @!attribute [r] emails
      # Electronic mail addresses
      # @return [Array<GOBL::Org::Email>]
      attribute? :emails, GOBL::Types::Array.of(GOBL::Org::Email).optional

      # @!attribute [r] telephones
      # Regular telephone numbers
      # @return [Array<GOBL::Org::Telephone>]
      attribute? :telephones, GOBL::Types::Array.of(GOBL::Org::Telephone).optional

      # @!attribute [r] registration
      # Additional registration details about the company that may need to be included in a document.
      # @return [GOBL::Org::Registration]
      attribute? :registration, GOBL::Org::Registration.optional

      # @!attribute [r] meta
      # Any additional semi-structured information that does not fit into the rest of the party.
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Party] the object created from the given data
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

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
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
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Party} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   The `new` method will only allow to create a new object if all attributes
      #   marked as mandatory and not calculated in the JSON schema are provided.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Party] the object corresponding to the given input
    end
  end
end
