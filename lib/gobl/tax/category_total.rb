# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Tax
    # CategoryTotal groups together all rates inside a given category.
    class CategoryTotal < GOBL::Struct
      # The Schema ID of the GOBL CategoryTotal structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/total#/$defs/CategoryTotal'

      # @!attribute [r] code
      # @return [GOBL::Org::Code]
      attribute :code, GOBL::Org::Code

      # @!attribute [r] retained
      # @return [Boolean]
      attribute? :retained, GOBL::Types::Bool.optional

      # @!attribute [r] rates
      # @return [Array<RateTotal>]
      attribute :rates, GOBL::Types::Array.of(RateTotal)

      # @!attribute [r] base
      # @return [GOBL::Num::Amount]
      attribute :base, GOBL::Types.Constructor(GOBL::Num::Amount)

      # @!attribute [r] amount
      # @return [GOBL::Num::Amount]
      attribute :amount, GOBL::Types.Constructor(GOBL::Num::Amount)

      # @!attribute [r] surcharge
      # @return [GOBL::Num::Amount]
      attribute? :surcharge, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [CategoryTotal] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          code: GOBL::Org::Code.from_gobl!(data['code']),
          retained: data['retained'],
          rates: data['rates']&.map { |item| RateTotal.from_gobl!(item) },
          base: data['base'],
          amount: data['amount'],
          surcharge: data['surcharge'] ? data['surcharge'] : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'code' => attributes[:code]&.to_gobl,
          'retained' => attributes[:retained],
          'rates' => attributes[:rates]&.map { |item| item&.to_gobl },
          'base' => attributes[:base]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl,
          'surcharge' => attributes[:surcharge]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {CategoryTotal} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [CategoryTotal] the object corresponding to the given input
    end
  end
end

