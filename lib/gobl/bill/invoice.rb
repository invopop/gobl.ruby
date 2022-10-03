# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Bill
    # Invoice represents a payment claim for goods or services supplied under conditions agreed between the supplier and the customer.
    class Invoice < GOBL::Struct
      # The Schema ID of the GOBL Invoice structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice'

      # @!attribute [r] uuid
      # Unique document ID. Not required, but always recommended in addition to the Code.
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] code
      # Sequential code used to identify this invoice in tax declarations.
      # @return [String]
      attribute :code, GOBL::Types::String

      # @!attribute [r] series
      # Used in addition to the Code in some regions.
      # @return [String]
      attribute? :series, GOBL::Types::String.optional

      # @!attribute [r] type
      # Optional invoice type, leave empty unless needed for a specific situation.
      # @return [InvoiceType]
      attribute? :type, InvoiceType.optional

      # @!attribute [r] currency
      # Currency for all invoice totals.
      # @return [GOBL::Currency::Code]
      attribute :currency, GOBL::Currency::Code

      # @!attribute [r] exchange_rates
      # Exchange rates to be used when converting the invoices monetary values into other currencies.
      # @return [ExchangeRates]
      attribute? :exchange_rates, ExchangeRates.optional

      # @!attribute [r] tax
      # Special tax configuration for billing.
      # @return [Tax]
      attribute? :tax, Tax.optional

      # @!attribute [r] preceding
      # Key information regarding a previous invoice and potentially details as to why it was corrected.
      # @return [Preceding]
      attribute? :preceding, Preceding.optional

      # @!attribute [r] issue_date
      # When the invoice was created.
      # @return [GOBL::Cal::Date]
      attribute :issue_date, GOBL::Cal::Date

      # @!attribute [r] op_date
      # Date when the operation defined by the invoice became effective.
      # @return [GOBL::Cal::Date]
      attribute? :op_date, GOBL::Cal::Date.optional

      # @!attribute [r] value_date
      # When the taxes of this invoice become accountable, if none set, the issue date is used.
      # @return [GOBL::Cal::Date]
      attribute? :value_date, GOBL::Cal::Date.optional

      # @!attribute [r] supplier
      # The taxable entity supplying the goods or services.
      # @return [GOBL::Org::Party]
      attribute :supplier, GOBL::Org::Party

      # @!attribute [r] customer
      # Legal entity receiving the goods or services, may be empty in certain circumstances such as simplified invoices.
      # @return [GOBL::Org::Party]
      attribute? :customer, GOBL::Org::Party.optional

      # @!attribute [r] lines
      # List of invoice lines representing each of the items sold to the customer.
      # @return [Array<Line>]
      attribute? :lines, GOBL::Types::Array.of(Line).optional

      # @!attribute [r] discounts
      # Discounts or allowances applied to the complete invoice
      # @return [Array<Discount>]
      attribute? :discounts, GOBL::Types::Array.of(Discount).optional

      # @!attribute [r] charges
      # Charges or surcharges applied to the complete invoice
      # @return [Array<Charge>]
      attribute? :charges, GOBL::Types::Array.of(Charge).optional

      # @!attribute [r] outlays
      # Expenses paid for by the supplier but invoiced directly to the customer.
      # @return [Array<Outlay>]
      attribute? :outlays, GOBL::Types::Array.of(Outlay).optional

      # @!attribute [r] ordering
      # @return [Ordering]
      attribute? :ordering, Ordering.optional

      # @!attribute [r] payment
      # @return [Payment]
      attribute? :payment, Payment.optional

      # @!attribute [r] delivery
      # @return [Delivery]
      attribute? :delivery, Delivery.optional

      # @!attribute [r] totals
      # Summary of all the invoice totals, including taxes (calculated).
      # @return [Totals]
      attribute? :totals, Totals.optional

      # @!attribute [r] notes
      # Unstructured information that is relevant to the invoice, such as correction or additional legal details.
      # @return [Array<GOBL::Org::Note>]
      attribute? :notes, GOBL::Types::Array.of(GOBL::Org::Note).optional

      # @!attribute [r] meta
      # Additional semi-structured data that doesn't fit into the body of the invoice.
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Invoice] the object created from the given data
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
          lines: data['lines']&.map { |item| Line.from_gobl!(item) },
          discounts: data['discounts']&.map { |item| Discount.from_gobl!(item) },
          charges: data['charges']&.map { |item| Charge.from_gobl!(item) },
          outlays: data['outlays']&.map { |item| Outlay.from_gobl!(item) },
          ordering: data['ordering'] ? Ordering.from_gobl!(data['ordering']) : nil,
          payment: data['payment'] ? Payment.from_gobl!(data['payment']) : nil,
          delivery: data['delivery'] ? Delivery.from_gobl!(data['delivery']) : nil,
          totals: data['totals'] ? Totals.from_gobl!(data['totals']) : nil,
          notes: data['notes']&.map { |item| GOBL::Org::Note.from_gobl!(item) },
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
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
          'lines' => attributes[:lines]&.map { |item| item&.to_gobl },
          'discounts' => attributes[:discounts]&.map { |item| item&.to_gobl },
          'charges' => attributes[:charges]&.map { |item| item&.to_gobl },
          'outlays' => attributes[:outlays]&.map { |item| item&.to_gobl },
          'ordering' => attributes[:ordering]&.to_gobl,
          'payment' => attributes[:payment]&.to_gobl,
          'delivery' => attributes[:delivery]&.to_gobl,
          'totals' => attributes[:totals]&.to_gobl,
          'notes' => attributes[:notes]&.map { |item| item&.to_gobl },
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Invoice} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   The `new` method will only allow to create a new object if all attributes
      #   marked as mandatory and not calculated in the JSON schema are provided.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Invoice] the object corresponding to the given input
    end
  end
end

