# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module CBC
    # ValueDefinition describes a specific value and how it maps to a human name and description if appropriate.
    class ValueDefinition < GOBL::Object
      # The Schema ID of the GOBL ValueDefinition structure
      SCHEMA_ID = 'https://gobl.org/draft-0/cbc/value-definition'

      # @!attribute [r] value
      # Value for which the definition is for.
      # @return [String]
      property :value, String
      validates_presence_of :value

      # @!attribute [r] name
      # Short name for the value, if relevant.
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String

      # @!attribute [r] desc
      # Description offering more details about when the value should be used.
      # @return [GOBL::I18n::String]
      property :desc, GOBL::I18n::String

      # @!attribute [r] meta
      # Meta defines any additional details that may be useful or associated with the value.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
