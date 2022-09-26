# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Tax
    # RateTotalSurcharge reflects the sum surcharges inside the rate.
    class RateTotalSurcharge < GOBL::Struct
      # The Schema ID of the GOBL RateTotalSurcharge structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/total#/$defs/RateTotalSurcharge'

      # @!attribute [r] percent
      # @return [GOBL::Num::Percentage]
      attribute :percent, GOBL::Types.Constructor(GOBL::Num::Percentage)

      # @!attribute [r] amount
      # @return [GOBL::Num::Amount]
      attribute :amount, GOBL::Types.Constructor(GOBL::Num::Amount)

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [RateTotalSurcharge] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          percent: data['percent'],
          amount: data['amount']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'percent' => attributes[:percent]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {RateTotalSurcharge} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [RateTotalSurcharge] the object corresponding to the given input
    end
  end
end

