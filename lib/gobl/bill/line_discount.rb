# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Bill
    # LineDiscount represents an amount deducted from the line, and will be applied before taxes.
    class LineDiscount < GOBL::Struct
      # The Schema ID of the GOBL LineDiscount structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/LineDiscount'

      # @!attribute [r] percent
      # Percentage if fixed amount not applied
      # @return [GOBL::Num::Percentage]
      attribute? :percent, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      # @!attribute [r] amount
      # Fixed discount amount to apply (calculated if percent present).
      # @return [GOBL::Num::Amount]
      attribute? :amount, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # @!attribute [r] code
      # Reason code.
      # @return [String]
      attribute? :code, GOBL::Types::String.optional

      # @!attribute [r] reason
      # Text description as to why the discount was applied
      # @return [String]
      attribute? :reason, GOBL::Types::String.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [LineDiscount] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          percent: data['percent'] ? data['percent'] : nil,
          amount: data['amount'] ? data['amount'] : nil,
          code: data['code'],
          reason: data['reason']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'percent' => attributes[:percent]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl,
          'code' => attributes[:code],
          'reason' => attributes[:reason]
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {LineDiscount} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   The `new` method will only allow to create a new object if all attributes
      #   marked as mandatory and not calculated in the JSON schema are provided.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [LineDiscount] the object corresponding to the given input
    end
  end
end

