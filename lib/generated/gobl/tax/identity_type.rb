# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.39.0
##

module GOBL
  module Tax
    # IdentityType describes a single possible value for a tax identity type.
    class IdentityType < GOBL::Object
      # The Schema ID of the GOBL IdentityType structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime#/$defs/IdentityType'

      # @!attribute [r] key
      # Key used to identify the type
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key
      validates_presence_of :key

      # @!attribute [r] name
      # Name for the identity type
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String

      # @!attribute [r] meta
      # Additional regime specific meta data
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
