# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Org
    # Party represents a person or business entity.
    class Party < GOBL::Object
      # The Schema ID of the GOBL Party structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/party'

      # @!attribute [r] $regime
      # @return [GOBL::L10n::TaxCountryCode]
      property :$regime, GOBL::L10n::TaxCountryCode

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] label
      # Label can be used to provide a custom label for the party in a given context in a single language, for example "Supplier", "Host", or similar.
      # @return [String]
      property :label, String

      # @!attribute [r] name
      # Legal name or representation of the organization.
      # @return [String]
      property :name, String

      # @!attribute [r] alias
      # Alternate short name.
      # @return [String]
      property :alias, String

      # @!attribute [r] tax_id
      # The entity's legal ID code used for tax purposes. They may have other numbers, but we're only interested in those valid for tax purposes.
      # @return [GOBL::Tax::Identity]
      property :tax_id, GOBL::Tax::Identity

      # @!attribute [r] identities
      # Set of codes used to identify the party in other systems.
      # @return [Array<GOBL::Org::Identity>]
      property :identities, [GOBL::Org::Identity]

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

      # @!attribute [r] websites
      # Public websites that provide further information about the party.
      # @return [Array<GOBL::Org::Website>]
      property :websites, [GOBL::Org::Website]

      # @!attribute [r] telephones
      # Regular telephone numbers
      # @return [Array<GOBL::Org::Telephone>]
      property :telephones, [GOBL::Org::Telephone]

      # @!attribute [r] registration
      # Additional registration details about the company that may need to be included in a document.
      # @return [GOBL::Org::Registration]
      property :registration, GOBL::Org::Registration

      # @!attribute [r] logos
      # Images that can be used to identify the party visually.
      # @return [Array<GOBL::Org::Image>]
      property :logos, [GOBL::Org::Image]

      # @!attribute [r] ext
      # Extension code map for any additional regime specific codes that may be required.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

      # @!attribute [r] meta
      # Any additional semi-structured information that does not fit into the rest of the party.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
