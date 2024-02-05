# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.67.0
##

module GOBL
  module Tax
    # CodeDefinition describes a specific code and how it maps to a human name and description if appropriate.
    class CodeDefinition < GOBL::Object
      # The Schema ID of the GOBL CodeDefinition structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime#/$defs/CodeDefinition'

      # @!attribute [r] code
      # Code for which the definition is for.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code
      validates_presence_of :code

      # @!attribute [r] name
      # Short name for the code, if relevant.
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String

      # @!attribute [r] desc
      # Description offering more details about when the code should be used.
      # @return [GOBL::I18n::String]
      property :desc, GOBL::I18n::String
    end
  end
end
