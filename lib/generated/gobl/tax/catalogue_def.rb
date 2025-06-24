# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # A CatalogueDef contains a set of re-useable extensions, scenarios, and validators that can be used by addons or tax regimes.
    class CatalogueDef < GOBL::Object
      # The Schema ID of the GOBL CatalogueDef structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/catalogue-def'

      # @!attribute [r] key
      # Key defines a unique identifier for the catalogue.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key
      validates_presence_of :key

      # @!attribute [r] name
      # Name is the name of the catalogue.
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates_presence_of :name

      # @!attribute [r] description
      # Description is a human readable description of the catalogue.
      # @return [GOBL::I18n::String]
      property :description, GOBL::I18n::String

      # @!attribute [r] extensions
      # Extensions defines all the extensions offered by the catalogue.
      # @return [Array<GOBL::CBC::Definition>]
      property :extensions, [GOBL::CBC::Definition]
      validates_presence_of :extensions
    end
  end
end
