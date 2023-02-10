# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.36.0
##

module GOBL
  module Org
    # Name represents what a human is called.
    class Name < GOBL::Object
      # The Schema ID of the GOBL Name structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/name'

      # @!attribute [r] uuid
      # Unique identity code
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] alias
      # What the person would like to be called
      # @return [String]
      property :alias, String

      # @!attribute [r] prefix
      # Additional prefix to add to name, like Mrs. or Mr.
      # @return [String]
      property :prefix, String

      # @!attribute [r] given
      # Person's given or first name
      # @return [String]
      property :given, String
      validates :given, presence: true

      # @!attribute [r] middle
      # Middle names or initials
      # @return [String]
      property :middle, String

      # @!attribute [r] surname
      # Second or Family name.
      # @return [String]
      property :surname, String
      validates :surname, presence: true

      # @!attribute [r] surname2
      # Additional second of family name.
      # @return [String]
      property :surname2, String

      # @!attribute [r] suffix
      # Titles to include after the name.
      # @return [String]
      property :suffix, String

      # @!attribute [r] meta
      # Any additional useful data.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
