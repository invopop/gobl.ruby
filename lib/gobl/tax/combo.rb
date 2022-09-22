# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##


module GOBL
  module Tax
    # Combo represents the tax combination of a category code and rate key.
    class Combo < GOBL::Struct
      # The Schema ID of the GOBL Combo structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/set#/$defs/Combo'

      # @!attribute [r] cat
      # Tax category code from those available inside a region.
      # @return [GOBL::Org::Code]
      attribute :cat, GOBL::Org::Code

      # @!attribute [r] rate
      # Rate within a category to apply.
      # @return [GOBL::Org::Key]
      attribute? :rate, GOBL::Org::Key.optional

      # @!attribute [r] percent
      # Percent defines the percentage set manually or determined from the rate key (calculated if rate present).
      # @return [GOBL::Num::Percentage]
      attribute? :percent, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      # @!attribute [r] surcharge
      # Some countries require an additional surcharge (calculated if rate present).
      # @return [GOBL::Num::Percentage]
      attribute? :surcharge, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Combo] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          cat: GOBL::Org::Code.from_gobl!(data['cat']),
          rate: data['rate'] ? GOBL::Org::Key.from_gobl!(data['rate']) : nil,
          percent: data['percent'] ? data['percent'] : nil,
          surcharge: data['surcharge'] ? data['surcharge'] : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'cat' => attributes[:cat]&.to_gobl,
          'rate' => attributes[:rate]&.to_gobl,
          'percent' => attributes[:percent]&.to_gobl,
          'surcharge' => attributes[:surcharge]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Combo} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Combo] the object corresponding to the given input
    end
  end
end

