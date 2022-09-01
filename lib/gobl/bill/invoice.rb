# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # Invoice represents a payment claim for goods or services supplied under conditions agreed between the supplier and the customer.
    class Invoice < GOBL::Struct
      # Unique document ID. Not required, but always recommended in addition to the Code.
      attribute? :uuid, GOBL::UUID::UUID.optional

      # Sequential code used to identify this invoice in tax declarations.
      attribute :code, GOBL::Types::String

      # Used in addition to the Code in some regions.
      attribute? :series, GOBL::Types::String.optional

      # Optional invoice type, leave empty unless needed for a specific situation.
      attribute? :type, InvoiceType.optional

      # Currency for all invoice totals.
      attribute :currency, GOBL::Currency::Code

      # Exchange rates to be used when converting the invoices monetary values into other currencies.
      attribute? :exchange_rates, ExchangeRates.optional

      # Special tax configuration for billing.
      attribute? :tax, Tax.optional

      # Key information regarding a previous invoice and potentially details as to why it was corrected.
      attribute? :preceding, Preceding.optional

      # When the invoice was created.
      attribute :issue_date, GOBL::Cal::Date

      # Date when the operation defined by the invoice became effective.
      attribute? :op_date, GOBL::Cal::Date.optional

      # When the taxes of this invoice become accountable, if none set, the issue date is used.
      attribute? :value_date, GOBL::Cal::Date.optional

      # The taxable entity supplying the goods or services.
      attribute :supplier, GOBL::Org::Party

      # Legal entity receiving the goods or services, may be empty in certain circumstances such as simplified invoices.
      attribute? :customer, GOBL::Org::Party.optional

      # List of invoice lines representing each of the items sold to the customer.
      attribute? :lines, Lines.optional

      # Discounts or allowances applied to the complete invoice
      attribute? :discounts, Discounts.optional

      # Charges or surcharges applied to the complete invoice
      attribute? :charges, Charges.optional

      # Expenses paid for by the supplier but invoiced directly to the customer.
      attribute? :outlays, Outlays.optional

      attribute? :ordering, Ordering.optional

      attribute? :payment, Payment.optional

      attribute? :delivery, Delivery.optional

      # Summary of all the invoice totals, including taxes (calculated).
      attribute? :totals, Totals.optional

      # Unstructured information that is relevant to the invoice, such as correction or additional legal details.
      attribute? :notes, GOBL::Org::Notes.optional

      # Additional semi-structured data that doesn't fit into the body of the invoice.
      attribute? :meta, GOBL::Org::Meta.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          code: data['code'],
          series: data['series'],
          type: data['type'] ? InvoiceType.from_gobl!(data['type']) : nil,
          currency: GOBL::Currency::Code.from_gobl!(data['currency']),
          exchange_rates: data['exchange_rates'] ? ExchangeRates.from_gobl!(data['exchange_rates']) : nil,
          tax: data['tax'] ? Tax.from_gobl!(data['tax']) : nil,
          preceding: data['preceding'] ? Preceding.from_gobl!(data['preceding']) : nil,
          issue_date: GOBL::Cal::Date.from_gobl!(data['issue_date']),
          op_date: data['op_date'] ? GOBL::Cal::Date.from_gobl!(data['op_date']) : nil,
          value_date: data['value_date'] ? GOBL::Cal::Date.from_gobl!(data['value_date']) : nil,
          supplier: GOBL::Org::Party.from_gobl!(data['supplier']),
          customer: data['customer'] ? GOBL::Org::Party.from_gobl!(data['customer']) : nil,
          lines: data['lines'] ? Lines.from_gobl!(data['lines']) : nil,
          discounts: data['discounts'] ? Discounts.from_gobl!(data['discounts']) : nil,
          charges: data['charges'] ? Charges.from_gobl!(data['charges']) : nil,
          outlays: data['outlays'] ? Outlays.from_gobl!(data['outlays']) : nil,
          ordering: data['ordering'] ? Ordering.from_gobl!(data['ordering']) : nil,
          payment: data['payment'] ? Payment.from_gobl!(data['payment']) : nil,
          delivery: data['delivery'] ? Delivery.from_gobl!(data['delivery']) : nil,
          totals: data['totals'] ? Totals.from_gobl!(data['totals']) : nil,
          notes: data['notes'] ? GOBL::Org::Notes.from_gobl!(data['notes']) : nil,
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'code' => attributes[:code],
          'series' => attributes[:series],
          'type' => attributes[:type]&.to_gobl,
          'currency' => attributes[:currency]&.to_gobl,
          'exchange_rates' => attributes[:exchange_rates]&.to_gobl,
          'tax' => attributes[:tax]&.to_gobl,
          'preceding' => attributes[:preceding]&.to_gobl,
          'issue_date' => attributes[:issue_date]&.to_gobl,
          'op_date' => attributes[:op_date]&.to_gobl,
          'value_date' => attributes[:value_date]&.to_gobl,
          'supplier' => attributes[:supplier]&.to_gobl,
          'customer' => attributes[:customer]&.to_gobl,
          'lines' => attributes[:lines]&.to_gobl,
          'discounts' => attributes[:discounts]&.to_gobl,
          'charges' => attributes[:charges]&.to_gobl,
          'outlays' => attributes[:outlays]&.to_gobl,
          'ordering' => attributes[:ordering]&.to_gobl,
          'payment' => attributes[:payment]&.to_gobl,
          'delivery' => attributes[:delivery]&.to_gobl,
          'totals' => attributes[:totals]&.to_gobl,
          'notes' => attributes[:notes]&.to_gobl,
          'meta' => attributes[:meta]&.to_gobl
        }
      end
    end
  end
end

