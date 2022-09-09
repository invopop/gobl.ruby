# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # Totals contains the summaries of all calculations for the invoice.
    class Totals < GOBL::Struct
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

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          sum: data['sum'],
          discount: data['discount'] ? data['discount'] : nil,
          charge: data['charge'] ? data['charge'] : nil,
          tax_included: data['tax_included'] ? data['tax_included'] : nil,
          total: data['total'],
          taxes: data['taxes'] ? GOBL::Tax::Total.from_gobl!(data['taxes']) : nil,
          tax: data['tax'] ? data['tax'] : nil,
          total_with_tax: data['total_with_tax'],
          outlays: data['outlays'] ? data['outlays'] : nil,
          payable: data['payable'],
          advance: data['advance'] ? data['advance'] : nil,
          due: data['due'] ? data['due'] : nil
        )
      end

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
    end
  end
end

