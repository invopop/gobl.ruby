# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##

module GOBL
  module Bill
    # Totals contains the summaries of all calculations for the invoice.
    class Totals < GOBL::Struct
      # The Schema ID of the GOBL Totals structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Totals'

      # @!attribute [r] sum
      # Sum of all line item sums
      # @return [GOBL::Num::Amount]
      attribute :sum, GOBL::Types.Constructor(GOBL::Num::Amount)

      # @!attribute [r] discount
      # Sum of all document level discounts
      # @return [GOBL::Num::Amount]
      attribute? :discount, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # @!attribute [r] charge
      # Sum of all document level charges
      # @return [GOBL::Num::Amount]
      attribute? :charge, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # @!attribute [r] tax_included
      # If prices include tax, this is the total tax included in the price.
      # @return [GOBL::Num::Amount]
      attribute? :tax_included, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # @!attribute [r] total
      # Sum of all line sums minus the discounts, plus the charges, without tax.
      # @return [GOBL::Num::Amount]
      attribute :total, GOBL::Types.Constructor(GOBL::Num::Amount)

      # @!attribute [r] taxes
      # Summary of all the taxes included in the invoice.
      # @return [GOBL::Tax::Total]
      attribute? :taxes, GOBL::Tax::Total.optional

      # @!attribute [r] tax
      # Total amount of tax to apply to the invoice.
      # @return [GOBL::Num::Amount]
      attribute? :tax, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # @!attribute [r] total_with_tax
      # Grand total after all taxes have been applied.
      # @return [GOBL::Num::Amount]
      attribute :total_with_tax, GOBL::Types.Constructor(GOBL::Num::Amount)

      # @!attribute [r] outlays
      # Total paid in outlays that need to be reimbursed
      # @return [GOBL::Num::Amount]
      attribute? :outlays, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # @!attribute [r] payable
      # Total amount to be paid after applying taxes and outlays.
      # @return [GOBL::Num::Amount]
      attribute :payable, GOBL::Types.Constructor(GOBL::Num::Amount)

      # @!attribute [r] advance
      # Total amount already paid in advance.
      # @return [GOBL::Num::Amount]
      attribute? :advance, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # @!attribute [r] due
      # How much actually needs to be paid now.
      # @return [GOBL::Num::Amount]
      attribute? :due, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Totals] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          sum: data['sum'],
          discount: data['discount'] || nil,
          charge: data['charge'] || nil,
          tax_included: data['tax_included'] || nil,
          total: data['total'],
          taxes: data['taxes'] ? GOBL::Tax::Total.from_gobl!(data['taxes']) : nil,
          tax: data['tax'] || nil,
          total_with_tax: data['total_with_tax'],
          outlays: data['outlays'] || nil,
          payable: data['payable'],
          advance: data['advance'] || nil,
          due: data['due'] || nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'sum' => attributes[:sum]&.to_gobl,
          'discount' => attributes[:discount]&.to_gobl,
          'charge' => attributes[:charge]&.to_gobl,
          'tax_included' => attributes[:tax_included]&.to_gobl,
          'total' => attributes[:total]&.to_gobl,
          'taxes' => attributes[:taxes]&.to_gobl,
          'tax' => attributes[:tax]&.to_gobl,
          'total_with_tax' => attributes[:total_with_tax]&.to_gobl,
          'outlays' => attributes[:outlays]&.to_gobl,
          'payable' => attributes[:payable]&.to_gobl,
          'advance' => attributes[:advance]&.to_gobl,
          'due' => attributes[:due]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Totals} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   The `new` method will only allow to create a new object if all attributes
      #   marked as mandatory and not calculated in the JSON schema are provided.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Totals] the object corresponding to the given input
    end
  end
end
