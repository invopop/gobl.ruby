# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.29.0
##

require 'dry-struct'

module GOBL
  module Bill
    # Totals contains the summaries of all calculations for the invoice.
    class Totals < Dry::Struct
      # Sum of all line item sums
      attribute :sum, GOBL::Types.Constructor(GOBL::Num::Amount)

      # Sum of all document level discounts
      attribute :discount, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # Sum of all document level charges
      attribute :charge, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # If prices include tax, this is the total tax included in the price.
      attribute :tax_included, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # Sum of all line sums minus the discounts, plus the charges, without tax.
      attribute :total, GOBL::Types.Constructor(GOBL::Num::Amount)

      # Summary of all the taxes included in the invoice.
      attribute :taxes, GOBL::Tax::Total.optional

      # Total amount of tax to apply to the invoice.
      attribute :tax, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # Grand total after all taxes have been applied.
      attribute :total_with_tax, GOBL::Types.Constructor(GOBL::Num::Amount)

      # Total paid in outlays that need to be reimbursed
      attribute :outlays, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # Total amount to be paid after applying taxes and outlays.
      attribute :payable, GOBL::Types.Constructor(GOBL::Num::Amount)

      # Total amount already paid in advance.
      attribute :advance, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # How much actually needs to be paid now.
      attribute :due, GOBL::Types.Constructor(GOBL::Num::Amount).optional

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

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
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
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

