# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Org
    # Person represents a human, and how to contact them electronically.
    class Person < GOBL::Object
      # The Schema ID of the GOBL Person structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/person'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] label
      # Label can be used to identify the person in a given context in a single language, for example "Attn", "Contact", "Responsible", etc.
      # @return [String]
      property :label, String

      # @!attribute [r] name
      # Complete details on the name of the person
      # @return [GOBL::Org::Name]
      property :name, GOBL::Org::Name
      validates_presence_of :name

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

      # @!attribute [r] avatars
      # Avatars provider links to images or photos or the person.
      # @return [Array<GOBL::Org::Image>]
      property :avatars, [GOBL::Org::Image]

      # @!attribute [r] meta
      # Data about the data.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
