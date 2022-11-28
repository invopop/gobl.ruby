# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.31.0
##

module GOBL
  module Tax
    # Rate defines a single rate inside a category
    class Rate < GOBL::Object
      # The Schema ID of the GOBL Rate structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/region#/$defs/Rate'

      # @!attribute [r] key
      # Key identifies this rate within the system
      # @return [GOBL::Org::Key]
      property :key, GOBL::Org::Key
      validates :key, presence: true

      # @!attribute [r] name
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates :name, presence: true

      # @!attribute [r] desc
      # @return [GOBL::I18n::String]
      property :desc, GOBL::I18n::String

      # @!attribute [r] values
      # Values contains a list of Value objects that contain the current and historical percentage values for the rate; order is important, newer values should come before older values.
      # @return [Array<RateValue>]
      property :values, [RateValue]
      validates :values, presence: true
    end
  end
end
