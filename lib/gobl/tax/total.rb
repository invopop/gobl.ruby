# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Tax
    # Total contains a set of Category Totals which in turn contain all the accumulated taxes contained in the document.
    class Total < GOBL::Struct
      # The Schema ID of the GOBL Total structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/total'

      # @!attribute [r] categories
      # Grouping of all the taxes by their category
      # @return [Array<CategoryTotal>]
      attribute? :categories, GOBL::Types::Array.of(CategoryTotal).optional

      # @!attribute [r] sum
      # Total value of all the taxes applied.
      # @return [GOBL::Num::Amount]
      attribute :sum, GOBL::Types.Constructor(GOBL::Num::Amount)

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Total] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          categories: data['categories']&.map { |item| CategoryTotal.from_gobl!(item) },
          sum: data['sum']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'categories' => attributes[:categories]&.map { |item| item&.to_gobl },
          'sum' => attributes[:sum]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Total} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   The `new` method will only allow to create a new object if all attributes
      #   marked as mandatory and not calculated in the JSON schema are provided.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Total] the object corresponding to the given input
    end
  end
end

