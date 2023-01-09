# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.34.1
##

module GOBL
  module Org
    # Person represents a human, and how to contact them electronically.
    class Person < GOBL::Object
      # The Schema ID of the GOBL Person structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/person'

      # @!attribute [r] id
      # Internal ID used to identify the person inside a document.
      # @return [String]
      property :id, String

      # @!attribute [r] uuid
      # Unique identity code
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] name
      # Complete details on the name of the person
      # @return [GOBL::Org::Name]
      property :name, GOBL::Org::Name
      validates :name, presence: true

      # @!attribute [r] role
      # What they do within an organization
      # @return [String]
      property :role, String

      # @!attribute [r] emails
      # Electronic mail addresses that belong to the person.
      # @return [Array<GOBL::Org::Email>]
      property :emails, [GOBL::Org::Email]

      # @!attribute [r] telephones
      # Regular phone or mobile numbers
      # @return [Array<GOBL::Org::Telephone>]
      property :telephones, [GOBL::Org::Telephone]

      # @!attribute [r] meta
      # Data about the data.
      # @return [GOBL::Org::Meta]
      property :meta, GOBL::Org::Meta
    end
  end
end
