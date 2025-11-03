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

      # @!attribute [r] rate
      # Rate defines the key for which this rate applies.
      # @return [GOBL::CBC::Key]
      property :rate, GOBL::CBC::Key
      validates_presence_of :rate

      # @!attribute [r] keys
      # Keys identifies the set of tax keys defined in the category that this rate can be used with.
      # @return [Array<GOBL::CBC::Key>]
      property :keys, [GOBL::CBC::Key]

      # @!attribute [r] name
      # Human name of the rate
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates_presence_of :name

      # @!attribute [r] desc
      # Useful description of the rate.
      # @return [GOBL::I18n::String]
      property :desc, GOBL::I18n::String

      # @!attribute [r] values
      # Values contains a list of Value objects that contain the current and historical percentage values for the rate and additional filters. Order is important, newer values should come before older values.
      # @return [Array<RateValueDef>]
      property :values, [RateValueDef]

      # @!attribute [r] meta
      # Meta contains additional information about the rate that is relevant for local frequently used implementations.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
