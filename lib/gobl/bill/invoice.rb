# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Invoice < Dry::Struct
      # Unique document ID. Not required, but always recommended in addition to the Code.
      attribute :uuid, GOBL::UUID::UUID.optional

      # Sequential code used to identify this invoice in tax declarations.
      attribute :code, GOBL::Types::String

      # Used in addition to the Code in some regions.
      attribute :series, GOBL::Types::String.optional

      # Functional type of the invoice, default is always 'commercial'.
      attribute :type_code, GOBL::Types::String.optional

      # Currency for all invoice totals.
      attribute :currency, GOBL::Types::String

      # Exchange rates to be used when converting the invoices monetary values into other currencies.
      attribute :rates, GOBL::Types::Array(GOBL::Currency::ExchangeRate).optional

      # Implies that all item prices already include the specified tax, especially useful for retailers or B2C companies where prices are often displayed including tax. We only only one tax category to be defined as it is overly complex to work-out what the base price should be from multiple rates.
      attribute :prices_include_tax, GOBL::Types::String.optional

      # Key information regarding a previous invoice.
      attribute :preceding, GOBL::Bill::Preceding.optional

      # When the invoice was created.
      attribute :issue_date, GOBL::Org::Date

      # Date when the operation defined by the invoice became effective.
      attribute :op_date, GOBL::Org::Date.optional

      # When the taxes of this invoice become accountable, if none set, the issue date is used.
      attribute :value_date, GOBL::Org::Date.optional

      # The taxable entity supplying the goods or services.
      attribute :supplier, GOBL::Org::Party

      # Legal entity receiving the goods or services, may be empty in certain circumstances such as simplified invoices.
      attribute :customer, GOBL::Org::Party.optional

      # List of invoice lines representing each of the items sold to the customer.
      attribute :lines, GOBL::Types::Array(GOBL::Bill::Line).optional

      # Discounts or allowances applied to the complete invoice
      attribute :discounts, GOBL::Types::Array(GOBL::Bill::Discount).optional

      # Charges or surcharges applied to the complete invoice
      attribute :charges, GOBL::Types::Array(GOBL::Bill::Charge).optional

      # Expenses paid for by the supplier but invoiced directly to the customer.
      attribute :outlays, GOBL::Types::Array(GOBL::Bill::Outlay).optional

      # Summary of all the invoice totals, including taxes.
      attribute :totals, GOBL::Bill::Totals

      attribute :ordering, GOBL::Bill::Ordering.optional

      attribute :payment, GOBL::Bill::Payment.optional

      attribute :delivery, GOBL::Bill::Delivery.optional

      # Unstructured information that is relevant to the invoice, such as correction details.
      attribute :notes, GOBL::Types::Array(GOBL::Org::Note).optional

      # Additional semi-structured data that doesn't fit into the body of the invoice.
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          code: gobl['code'],
          series: gobl['series'],
          type_code: gobl['type_code'],
          currency: gobl['currency'],
          rates: gobl['rates']&.map { |x| GOBL::Currency::ExchangeRate.from_gobl!(x) },
          prices_include_tax: gobl['prices_include_tax'],
          preceding: gobl['preceding'] ? GOBL::Bill::Preceding.from_gobl!(gobl['preceding']) : nil,
          issue_date: GOBL::Org::Date.from_gobl!(gobl['issue_date']),
          op_date: gobl['op_date'] ? GOBL::Org::Date.from_gobl!(gobl['op_date']) : nil,
          value_date: gobl['value_date'] ? GOBL::Org::Date.from_gobl!(gobl['value_date']) : nil,
          supplier: GOBL::Org::Party.from_gobl!(gobl['supplier']),
          customer: gobl['customer'] ? GOBL::Org::Party.from_gobl!(gobl['customer']) : nil,
          lines: gobl['lines']&.map { |x| GOBL::Bill::Line.from_gobl!(x) },
          discounts: gobl['discounts']&.map { |x| GOBL::Bill::Discount.from_gobl!(x) },
          charges: gobl['charges']&.map { |x| GOBL::Bill::Charge.from_gobl!(x) },
          outlays: gobl['outlays']&.map { |x| GOBL::Bill::Outlay.from_gobl!(x) },
          totals: GOBL::Bill::Totals.from_gobl!(gobl['totals']),
          ordering: gobl['ordering'] ? GOBL::Bill::Ordering.from_gobl!(gobl['ordering']) : nil,
          payment: gobl['payment'] ? GOBL::Bill::Payment.from_gobl!(gobl['payment']) : nil,
          delivery: gobl['delivery'] ? GOBL::Bill::Delivery.from_gobl!(gobl['delivery']) : nil,
          notes: gobl['notes']&.map { |x| GOBL::Org::Note.from_gobl!(x) },
          meta: gobl['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'code' => attributes[:code],
          'series' => attributes[:series],
          'type_code' => attributes[:type_code],
          'currency' => attributes[:currency],
          'rates' => attributes[:rates]&.map { |x| x&.to_gobl },
          'prices_include_tax' => attributes[:prices_include_tax],
          'preceding' => attributes[:preceding]&.to_gobl,
          'issue_date' => attributes[:issue_date]&.to_gobl,
          'op_date' => attributes[:op_date]&.to_gobl,
          'value_date' => attributes[:value_date]&.to_gobl,
          'supplier' => attributes[:supplier]&.to_gobl,
          'customer' => attributes[:customer]&.to_gobl,
          'lines' => attributes[:lines]&.map { |x| x&.to_gobl },
          'discounts' => attributes[:discounts]&.map { |x| x&.to_gobl },
          'charges' => attributes[:charges]&.map { |x| x&.to_gobl },
          'outlays' => attributes[:outlays]&.map { |x| x&.to_gobl },
          'totals' => attributes[:totals]&.to_gobl,
          'ordering' => attributes[:ordering]&.to_gobl,
          'payment' => attributes[:payment]&.to_gobl,
          'delivery' => attributes[:delivery]&.to_gobl,
          'notes' => attributes[:notes]&.map { |x| x&.to_gobl },
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
