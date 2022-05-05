# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Totals < Dry::Struct
      # Sum of all line item sums
      attribute :sum, GOBL::Num::Amount

      # Sum of all document level discounts
      attribute :discount, GOBL::Num::Amount.optional

      # Sum of all document level charges
      attribute :charge, GOBL::Num::Amount.optional

      # If prices include tax, this is the total tax included in the price.
      attribute :tax_included, GOBL::Num::Amount.optional

      # Sum of all line sums minus the discounts, plus the charges, without tax.
      attribute :total, GOBL::Num::Amount

      # Summary of all the taxes included in the invoice.
      attribute :taxes, GOBL::Tax::Total.optional

      # Total amount of tax to apply to the invoice.
      attribute :tax, GOBL::Num::Amount.optional

      # Grand total after all taxes have been applied.
      attribute :total_with_tax, GOBL::Num::Amount

      # Total paid in outlays that need to be reimbursed
      attribute :outlays, GOBL::Num::Amount.optional

      # Total amount to be paid after applying taxes and outlays.
      attribute :payable, GOBL::Num::Amount

      # Total amount already paid in advance.
      attribute :advance, GOBL::Num::Amount.optional

      # How much actually needs to be paid now.
      attribute :due, GOBL::Num::Amount.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          sum: GOBL::Num::Amount.from_gobl!(data['sum']),
          discount: data['discount'] ? GOBL::Num::Amount.from_gobl!(data['discount']) : nil,
          charge: data['charge'] ? GOBL::Num::Amount.from_gobl!(data['charge']) : nil,
          tax_included: data['tax_included'] ? GOBL::Num::Amount.from_gobl!(data['tax_included']) : nil,
          total: GOBL::Num::Amount.from_gobl!(data['total']),
          taxes: data['taxes'] ? GOBL::Tax::Total.from_gobl!(data['taxes']) : nil,
          tax: data['tax'] ? GOBL::Num::Amount.from_gobl!(data['tax']) : nil,
          total_with_tax: GOBL::Num::Amount.from_gobl!(data['total_with_tax']),
          outlays: data['outlays'] ? GOBL::Num::Amount.from_gobl!(data['outlays']) : nil,
          payable: GOBL::Num::Amount.from_gobl!(data['payable']),
          advance: data['advance'] ? GOBL::Num::Amount.from_gobl!(data['advance']) : nil,
          due: data['due'] ? GOBL::Num::Amount.from_gobl!(data['due']) : nil
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
