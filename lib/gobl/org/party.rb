# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##

module GOBL
  module Org
    # Party represents a person or business entity.
    class Party < GOBL::Object
      # The Schema ID of the GOBL Party structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/party'

      # @!attribute [r] id
      # Internal ID used to identify the party inside a document.
      # @return [String]
      property :id, String

      # @!attribute [r] uuid
      # Unique identity code
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] tax_id
      # The entity's legal ID code used for tax purposes. They may have other numbers, but we're only interested in those valid for tax purposes.
      # @return [GOBL::Org::TaxIdentity]
      property :tax_id, GOBL::Org::TaxIdentity

      # @!attribute [r] name
      # Legal name or representation of the organization.
      # @return [String]
      property :name, String
      validates :name, presence: true

      # @!attribute [r] alias
      # Alternate short name.
      # @return [String]
      property :alias, String

      # @!attribute [r] people
      # Details of physical people who represent the party.
      # @return [Array<GOBL::Org::Person>]
      property :people, [GOBL::Org::Person]

      # @!attribute [r] inboxes
      # Digital inboxes used for forwarding electronic versions of documents
      # @return [Array<GOBL::Org::Inbox>]
      property :inboxes, [GOBL::Org::Inbox]

      # @!attribute [r] addresses
      # Regular post addresses for where information should be sent if needed.
      # @return [Array<GOBL::Org::Address>]
      property :addresses, [GOBL::Org::Address]

      # @!attribute [r] emails
      # Electronic mail addresses
      # @return [Array<GOBL::Org::Email>]
      property :emails, [GOBL::Org::Email]

      # @!attribute [r] telephones
      # Regular telephone numbers
      # @return [Array<GOBL::Org::Telephone>]
      property :telephones, [GOBL::Org::Telephone]

      # @!attribute [r] registration
      # Additional registration details about the company that may need to be included in a document.
      # @return [GOBL::Org::Registration]
      property :registration, GOBL::Org::Registration

      # @!attribute [r] meta
      # Any additional semi-structured information that does not fit into the rest of the party.
      # @return [GOBL::Org::Meta]
      property :meta, GOBL::Org::Meta
    end
  end
end
