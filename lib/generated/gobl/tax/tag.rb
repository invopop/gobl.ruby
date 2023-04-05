# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.42.0
##

module GOBL
  module Tax
    # Tag describes a tax tag that can be used to identify additional requirements in an electronic invoice.
    class Tag < GOBL::Object
      # The Schema ID of the GOBL Tag structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime#/$defs/Tag'

      # @!attribute [r] key
      # Key used to identify the tag
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key
      validates_presence_of :key

      # @!attribute [r] name
      # Name of this tag.
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String

      # @!attribute [r] meta
      # Additional local
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
