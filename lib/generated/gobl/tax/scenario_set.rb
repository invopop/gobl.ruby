# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # ScenarioSet is a collection of tax scenarios for a given schema that can be used to determine special codes or notes that need to be included in the final document.
    class ScenarioSet < GOBL::Object
      # The Schema ID of the GOBL ScenarioSet structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime-def#/$defs/ScenarioSet'

      # @!attribute [r] schema
      # Partial or complete schema URL for the document type
      # @return [String]
      property :schema, String
      validates_presence_of :schema

      # @!attribute [r] list
      # List of scenarios for the schema
      # @return [Array<Scenario>]
      property :list, [Scenario]
      validates_presence_of :list
    end
  end
end
