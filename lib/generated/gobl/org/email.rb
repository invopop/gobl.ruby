# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.67.0
##

module GOBL
  module Org
    # Email describes the electronic mailing details.
    class Email < GOBL::Object
      # The Schema ID of the GOBL Email structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/email'

      # @!attribute [r] uuid
      # Unique identity code
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] label
      # Identifier for the email.
      # @return [String]
      property :label, String

      # @!attribute [r] addr
      # Electronic mailing address.
      # @return [String]
      property :addr, String
      validates_presence_of :addr

      # @!attribute [r] meta
      # Additional fields.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
