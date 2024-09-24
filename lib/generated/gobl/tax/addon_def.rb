# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # AddonDef is an interface that defines the methods that a tax add-on must implement.
    class AddonDef < GOBL::Object
      # The Schema ID of the GOBL AddonDef structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/addon-def'

      # @!attribute [r] key
      # Key that defines how to uniquely idenitfy the add-on.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key
      validates_presence_of :key

      # @!attribute [r] name
      # Name of the add-on
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates_presence_of :name

      # @!attribute [r] description
      # Description of the add-on
      # @return [GOBL::I18n::String]
      property :description, GOBL::I18n::String

      # @!attribute [r] extensions
      # Extensions defines the list of extensions that are associated with an add-on.
      # @return [Array<GOBL::CBC::KeyDefinition>]
      property :extensions, [GOBL::CBC::KeyDefinition]
      validates_presence_of :extensions

      # @!attribute [r] tags
      # Tags is slice of tag sets that define what can be assigned to each document schema.
      # @return [Array<TagSet>]
      property :tags, [TagSet]

      # @!attribute [r] scenarios
      # Scenarios are applied to documents after normalization and before validation to ensure that form specific extensions have been added to the document.
      # @return [Array<ScenarioSet>]
      property :scenarios, [ScenarioSet]
      validates_presence_of :scenarios

      # @!attribute [r] inboxes
      # Inboxes is a list of keys that are used to identify where copies of documents can be sent.
      # @return [Array<GOBL::CBC::KeyDefinition>]
      property :inboxes, [GOBL::CBC::KeyDefinition]

      # @!attribute [r] corrections
      # Corrections is used to provide a map of correction definitions that are supported by the add-on.
      # @return [CorrectionSet]
      property :corrections, CorrectionSet
      validates_presence_of :corrections
    end
  end
end
