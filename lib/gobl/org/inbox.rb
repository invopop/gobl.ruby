# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.31.0
##

module GOBL
  module Org
    # Inbox is used to store data about a connection with a service that is responsible for potentially receiving copies of GOBL envelopes or other document formats defined locally.
    class Inbox < GOBL::Object
      # The Schema ID of the GOBL Inbox structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/inbox'

      # @!attribute [r] uuid
      # Unique ID. Useful if inbox is stored in a database.
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] key
      # Type of inbox being defined.
      # @return [GOBL::Org::Key]
      property :key, GOBL::Org::Key
      validates :key, presence: true

      # @!attribute [r] role
      # Role assigned to this inbox that may be relevant for the consumer.
      # @return [GOBL::Org::Key]
      property :role, GOBL::Org::Key

      # @!attribute [r] name
      # Human name for the inbox.
      # @return [String]
      property :name, String

      # @!attribute [r] code
      # Actual Code or ID that identifies the Inbox.
      # @return [String]
      property :code, String
      validates :code, presence: true
    end
  end
end
