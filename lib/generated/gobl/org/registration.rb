# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.39.0
##

module GOBL
  module Org
    # Registration is used in countries that require additional information to be associated with a company usually related to a specific registration office.
    class Registration < GOBL::Object
      # The Schema ID of the GOBL Registration structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/registration'

      # @!attribute [r] uuid
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] office
      # @return [String]
      property :office, String

      # @!attribute [r] book
      # @return [String]
      property :book, String

      # @!attribute [r] volume
      # @return [String]
      property :volume, String

      # @!attribute [r] sheet
      # @return [String]
      property :sheet, String

      # @!attribute [r] section
      # @return [String]
      property :section, String

      # @!attribute [r] page
      # @return [String]
      property :page, String

      # @!attribute [r] entry
      # @return [String]
      property :entry, String
    end
  end
end
