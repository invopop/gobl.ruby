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

      # Code for the region the invoice should be validated with.
      attribute :region, GOBL::Types::String

      # Sequential code used to identify this invoice in tax declarations.
      attribute :code, GOBL::Types::String

      # Used in addition to the Code in some regions.
      attribute :series, GOBL::Types::String.optional

      # Functional type of the invoice, default is always 'commercial'.
      attribute :type_code, GOBL::Types::String.optional

      # Currency for all invoice totals.
      attribute :currency, GOBL::Types::String

      # Exchange rates to be used when converting the invoices monetary values into other currencies.
      attribute :rates, GOBL::Types::Array(GOBL::Currency::Exchange-rate).optional

      # Implies that all item prices already include the specified tax, especially useful for retailers or B2C companies where prices are often displayed including tax. We only only one tax category to be defined as it is overly complex to work-out what the base price should be from multiple rates.
      attribute :prices_include_tax, GOBL::Types::String.optional

      # Key information regarding a previous invoice and potentially details as to why it was corrected.
      attribute :preceding, Preceding.optional

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
      attribute :lines, GOBL::Types::Array(Line).optional

      # Discounts or allowances applied to the complete invoice
      attribute :discounts, GOBL::Types::Array(Discount).optional

      # Charges or surcharges applied to the complete invoice
      attribute :charges, GOBL::Types::Array(Charge).optional

      # Expenses paid for by the supplier but invoiced directly to the customer.
      attribute :outlays, GOBL::Types::Array(Outlay).optional

      # Summary of all the invoice totals, including taxes.
      attribute :totals, Totals

      attribute :ordering, Ordering.optional

      attribute :payment, Payment.optional

      attribute :delivery, Delivery.optional

      # Unstructured information that is relevant to the invoice, such as correction or additional legal details.
      attribute :notes, GOBL::Types::Array(GOBL::Org::Note).optional

      # Additional semi-structured data that doesn't fit into the body of the invoice.
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          region: data['region'],
          code: data['code'],
          series: data['series'],
          type_code: data['type_code'],
          currency: data['currency'],
          rates: data['rates']&.map { |item| GOBL::Currency::Exchange-rate.from_gobl!(item) },
          prices_include_tax: data['prices_include_tax'],
          preceding: data['preceding'] ? Preceding.from_gobl!(data['preceding']) : nil,
          issue_date: GOBL::Org::Date.from_gobl!(data['issue_date']),
          op_date: data['op_date'] ? GOBL::Org::Date.from_gobl!(data['op_date']) : nil,
          value_date: data['value_date'] ? GOBL::Org::Date.from_gobl!(data['value_date']) : nil,
          supplier: GOBL::Org::Party.from_gobl!(data['supplier']),
          customer: data['customer'] ? GOBL::Org::Party.from_gobl!(data['customer']) : nil,
          lines: data['lines']&.map { |item| Line.from_gobl!(item) },
          discounts: data['discounts']&.map { |item| Discount.from_gobl!(item) },
          charges: data['charges']&.map { |item| Charge.from_gobl!(item) },
          outlays: data['outlays']&.map { |item| Outlay.from_gobl!(item) },
          totals: Totals.from_gobl!(data['totals']),
          ordering: data['ordering'] ? Ordering.from_gobl!(data['ordering']) : nil,
          payment: data['payment'] ? Payment.from_gobl!(data['payment']) : nil,
          delivery: data['delivery'] ? Delivery.from_gobl!(data['delivery']) : nil,
          notes: data['notes']&.map { |item| GOBL::Org::Note.from_gobl!(item) },
          meta: data['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'region' => attributes[:region],
          'code' => attributes[:code],
          'series' => attributes[:series],
          'type_code' => attributes[:type_code],
          'currency' => attributes[:currency],
          'rates' => attributes[:rates]&.map { |item| item&.to_gobl },
          'prices_include_tax' => attributes[:prices_include_tax],
          'preceding' => attributes[:preceding]&.to_gobl,
          'issue_date' => attributes[:issue_date]&.to_gobl,
          'op_date' => attributes[:op_date]&.to_gobl,
          'value_date' => attributes[:value_date]&.to_gobl,
          'supplier' => attributes[:supplier]&.to_gobl,
          'customer' => attributes[:customer]&.to_gobl,
          'lines' => attributes[:lines]&.map { |item| item&.to_gobl },
          'discounts' => attributes[:discounts]&.map { |item| item&.to_gobl },
          'charges' => attributes[:charges]&.map { |item| item&.to_gobl },
          'outlays' => attributes[:outlays]&.map { |item| item&.to_gobl },
          'totals' => attributes[:totals]&.to_gobl,
          'ordering' => attributes[:ordering]&.to_gobl,
          'payment' => attributes[:payment]&.to_gobl,
          'delivery' => attributes[:delivery]&.to_gobl,
          'notes' => attributes[:notes]&.map { |item| item&.to_gobl },
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
