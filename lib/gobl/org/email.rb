# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
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
      validates :addr, presence: true

      # @!attribute [r] meta
      # Additional fields.
      # @return [GOBL::Org::Meta]
      property :meta, GOBL::Org::Meta
    end
  end
end
