# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # TagSet defines a set of tags and their descriptions that can be used for a specific schema in the context of a Regime or Addon.
    class TagSet < GOBL::Object
      # The Schema ID of the GOBL TagSet structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime-def#/$defs/TagSet'

      # @!attribute [r] schema
      # Schema that the tags are associated with.
      # @return [String]
      property :schema, String
      validates_presence_of :schema

      # @!attribute [r] list
      # List of tags for the schema
      # @return [Array<GOBL::CBC::Definition>]
      property :list, [GOBL::CBC::Definition]
      validates_presence_of :list
    end
  end
end
