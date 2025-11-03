# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # KeyDef defines a key that can be used inside a tax category.
    class KeyDef < GOBL::Object
      # The Schema ID of the GOBL KeyDef structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime-def#/$defs/KeyDef'

      # @!attribute [r] key
      # Key identifies this rate within the system
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] name
      # Human name of the rate set
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String

      # @!attribute [r] desc
      # Useful description of the rate.
      # @return [GOBL::I18n::String]
      property :desc, GOBL::I18n::String

      # @!attribute [r] no_percent
      # NoPercent when true implies that the rate when used in a tax Combo should not define a percent value.
      # @return [Boolean]
      property :no_percent, Boolean
    end
  end
end
