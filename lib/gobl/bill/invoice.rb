# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.34.1
##

module GOBL
  module Bill
    # Invoice represents a payment claim for goods or services supplied under conditions agreed between the supplier and the customer.
    class Invoice < GOBL::Object
      # The Schema ID of the GOBL Invoice structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice'

      # @!attribute [r] uuid
      # Unique document ID. Not required, but always recommended in addition to the Code.
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] code
      # Sequential code used to identify this invoice in tax declarations.
      # @return [String]
      property :code, String
      validates :code, presence: true

      # @!attribute [r] series
      # Used in addition to the Code in some regions.
      # @return [String]
      property :series, String

      # @!attribute [r] type
      # Optional invoice type, leave empty unless needed for a specific situation.
      # @return [InvoiceType]
      property :type, InvoiceType

      # @!attribute [r] currency
      # Currency for all invoice totals.
      # @return [GOBL::Currency::Code]
      property :currency, GOBL::Currency::Code
      validates :currency, presence: true

      # @!attribute [r] exchange_rates
      # Exchange rates to be used when converting the invoices monetary values into other currencies.
      # @return [ExchangeRates]
      property :exchange_rates, ExchangeRates

      # @!attribute [r] tax
      # Special tax configuration for billing.
      # @return [Tax]
      property :tax, Tax

      # @!attribute [r] preceding
      # Key information regarding previous invoices and potentially details as to why they were corrected.
      # @return [Array<Preceding>]
      property :preceding, [Preceding]

      # @!attribute [r] issue_date
      # When the invoice was created.
      # @return [GOBL::Cal::Date]
      property :issue_date, GOBL::Cal::Date
      validates :issue_date, presence: true

      # @!attribute [r] op_date
      # Date when the operation defined by the invoice became effective.
      # @return [GOBL::Cal::Date]
      property :op_date, GOBL::Cal::Date

      # @!attribute [r] value_date
      # When the taxes of this invoice become accountable, if none set, the issue date is used.
      # @return [GOBL::Cal::Date]
      property :value_date, GOBL::Cal::Date

      # @!attribute [r] supplier
      # The taxable entity supplying the goods or services.
      # @return [GOBL::Org::Party]
      property :supplier, GOBL::Org::Party
      validates :supplier, presence: true

      # @!attribute [r] customer
      # Legal entity receiving the goods or services, may be empty in certain circumstances such as simplified invoices.
      # @return [GOBL::Org::Party]
      property :customer, GOBL::Org::Party

      # @!attribute [r] lines
      # List of invoice lines representing each of the items sold to the customer.
      # @return [Array<Line>]
      property :lines, [Line]

      # @!attribute [r] discounts
      # Discounts or allowances applied to the complete invoice
      # @return [Array<Discount>]
      property :discounts, [Discount]

      # @!attribute [r] charges
      # Charges or surcharges applied to the complete invoice
      # @return [Array<Charge>]
      property :charges, [Charge]

      # @!attribute [r] outlays
      # Expenses paid for by the supplier but invoiced directly to the customer.
      # @return [Array<Outlay>]
      property :outlays, [Outlay]

      # @!attribute [r] ordering
      # @return [Ordering]
      property :ordering, Ordering

      # @!attribute [r] payment
      # @return [Payment]
      property :payment, Payment

      # @!attribute [r] delivery
      # @return [Delivery]
      property :delivery, Delivery

      # @!attribute [r] totals
      # Summary of all the invoice totals, including taxes (calculated).
      # @return [Totals]
      property :totals, Totals

      # @!attribute [r] notes
      # Unstructured information that is relevant to the invoice, such as correction or additional legal details.
      # @return [Array<GOBL::Org::Note>]
      property :notes, [GOBL::Org::Note]

      # @!attribute [r] meta
      # Additional semi-structured data that doesn't fit into the body of the invoice.
      # @return [GOBL::Org::Meta]
      property :meta, GOBL::Org::Meta
    end
  end
end
