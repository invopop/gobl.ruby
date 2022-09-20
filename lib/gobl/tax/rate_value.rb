# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Tax
    # RateValue contains a percentage rate or fixed amount for a given date range.
    class RateValue < GOBL::Struct
      # The Schema ID of the GOBL RateValue structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/region#/$defs/RateValue'

      # @!attribute [r] since
      # Date from which this value should be applied.
      # @return [GOBL::Cal::Date]
      attribute? :since, GOBL::Cal::Date.optional

      # @!attribute [r] percent
      # Percent rate that should be applied
      # @return [GOBL::Num::Percentage]
      attribute :percent, GOBL::Types.Constructor(GOBL::Num::Percentage)

      # @!attribute [r] surcharge
      # An additional surcharge to apply.
      # @return [GOBL::Num::Percentage]
      attribute? :surcharge, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      # @!attribute [r] disabled
      # When true, this value should no longer be used.
      # @return [Boolean]
      attribute? :disabled, GOBL::Types::Bool.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [RateValue] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          since: data['since'] ? GOBL::Cal::Date.from_gobl!(data['since']) : nil,
          percent: data['percent'],
          surcharge: data['surcharge'] ? data['surcharge'] : nil,
          disabled: data['disabled']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'since' => attributes[:since]&.to_gobl,
          'percent' => attributes[:percent]&.to_gobl,
          'surcharge' => attributes[:surcharge]&.to_gobl,
          'disabled' => attributes[:disabled]
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {RateValue} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [RateValue] the object corresponding to the given input
    end
  end
end

