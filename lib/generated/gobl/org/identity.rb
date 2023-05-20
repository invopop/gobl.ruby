# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.42.8
##

module GOBL
  module Org
    # Identity is used to define a code for a specific context.
    class Identity < GOBL::Object
      # The Schema ID of the GOBL Identity structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/identity'

      # @!attribute [r] uuid
      # Unique identity for this identity object.
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] label
      # Optional label useful for non-standard identities to give a bit more context.
      # @return [String]
      property :label, String

      # @!attribute [r] type
      # The type of Code being represented and usually specific for a particular context, country, or tax regime.
      # @return [GOBL::CBC::Code]
      property :type, GOBL::CBC::Code

      # @!attribute [r] code
      # The actual value of the identity code.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code
      validates_presence_of :code
    end
  end
end
