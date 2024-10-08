# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # RateDef defines a single rate inside a category
    class RateDef < GOBL::Object
      # The Schema ID of the GOBL RateDef structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime-def#/$defs/RateDef'

      # @!attribute [r] key
      # Key identifies this rate within the system
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key
      validates_presence_of :key

      # @!attribute [r] name
      # Human name of the rate
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates_presence_of :name

      # @!attribute [r] desc
      # Useful description of the rate.
      # @return [GOBL::I18n::String]
      property :desc, GOBL::I18n::String

      # @!attribute [r] exempt
      # Exempt when true implies that the rate when used in a tax Combo should not define a percent value.
      # @return [Boolean]
      property :exempt, Boolean

      # @!attribute [r] values
      # Values contains a list of Value objects that contain the current and historical percentage values for the rate and additional filters. Order is important, newer values should come before older values.
      # @return [Array<RateValueDef>]
      property :values, [RateValueDef]

      # @!attribute [r] ext
      # Extensions key-value pair that will be copied to the tax combo if this rate is used.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

      # @!attribute [r] meta
      # Meta contains additional information about the rate that is relevant for local frequently used implementations.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
