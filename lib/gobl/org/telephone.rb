# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.38.0
##

module GOBL
  module Org
    # Telephone describes what is expected for a telephone number.
    class Telephone < GOBL::Object
      # The Schema ID of the GOBL Telephone structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/telephone'

      # @!attribute [r] uuid
      # Unique identity code
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] label
      # Identifier for this number.
      # @return [String]
      property :label, String

      # @!attribute [r] num
      # The number to be dialed in ITU E.164 international format.
      # @return [String]
      property :num, String
      validates :num, presence: true
    end
  end
end
