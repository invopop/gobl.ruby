# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # Invoice represents a payment claim for goods or services supplied under conditions agreed between the supplier and the customer.
    class Invoice < GOBL::Object
      # The Schema ID of the GOBL Invoice structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice'

      # Enumeration of possible values for {#$regime} with their corresponding descriptions
      $REGIME_ENUM = {
        'AT' => 'Austria',
        'BE' => 'Belgium',
        'CA' => 'Canada',
        'CH' => 'Switzerland',
        'CO' => 'Colombia',
        'DE' => 'Germany',
        'EL' => 'Greece',
        'ES' => 'Spain',
        'FR' => 'France',
        'GB' => 'United Kingdom',
        'IT' => 'Italy',
        'MX' => 'Mexico',
        'NL' => 'The Netherlands',
        'PL' => 'Poland',
        'PT' => 'Portugal',
        'US' => 'United States of America'
      }.freeze

      # @!attribute [r] $regime
      # @return [GOBL::L10n::TaxCountryCode]
      property :$regime, GOBL::L10n::TaxCountryCode
      validates_inclusion_of :$regime, in: $REGIME_ENUM.keys, allow_blank: true

      # @!attribute [r] $addons
      # Addons defines a list of keys used to identify tax addons that apply special normalization, scenarios, and validation rules to a document.
      # @return [Array<GOBL::CBC::Key>]
      property :$addons, [GOBL::CBC::Key]

      # @!attribute [r] $tags
      # Tags are used to help identify specific tax scenarios or requirements that will apply changes to the contents of the invoice. Tags by design should always be optional, it should always be possible to build a valid invoice without any tags.
      # @return [Array<GOBL::CBC::Key>]
      property :$tags, [GOBL::CBC::Key]

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # Enumeration of possible values for {#type} with their corresponding descriptions
      TYPE_ENUM = {
        'standard' => 'A regular commercial invoice document between a supplier and customer.',
        'proforma' => 'For a clients validation before sending a final invoice.',
        'corrective' => 'Corrected invoice that completely *replaces* the preceding document.',
        'credit-note' => 'Reflects a refund either partial or complete of the preceding document. A 
      credit note effectively *extends* the previous document.',
        'debit-note' => 'An additional set of charges to be added to the preceding document.',
        'other' => 'Any other type of invoice that does not fit into the standard categories and implies
      that any scenarios defined in tax regimes or addons will not be applied.

      This is useful for being able to create invoices with custom types in extensions,
      but is not recommend for general use.'
      }.freeze

      # @!attribute [r] type
      # Type of invoice document subject to the requirements of the local tax regime.
      # @return [GOBL::CBC::Key]
      property :type, GOBL::CBC::Key
      validates_inclusion_of :type, in: TYPE_ENUM.keys, allow_blank: true

      # @!attribute [r] series
      # Used as a prefix to group codes.
      # @return [GOBL::CBC::Code]
      property :series, GOBL::CBC::Code

      # @!attribute [r] code
      # Sequential code used to identify this invoice in tax declarations.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code
      validates_presence_of :code

      # @!attribute [r] issue_date
      # When the invoice was created.
      # @return [GOBL::Cal::Date]
      property :issue_date, GOBL::Cal::Date

      # @!attribute [r] op_date
      # Date when the operation defined by the invoice became effective.
      # @return [GOBL::Cal::Date]
      property :op_date, GOBL::Cal::Date

      # @!attribute [r] value_date
      # When the taxes of this invoice become accountable, if none set, the issue date is used.
      # @return [GOBL::Cal::Date]
      property :value_date, GOBL::Cal::Date

      # @!attribute [r] currency
      # Currency for all invoice totals.
      # @return [GOBL::Currency::Code]
      property :currency, GOBL::Currency::Code

      # @!attribute [r] exchange_rates
      # Exchange rates to be used when converting the invoices monetary values into other currencies.
      # @return [Array<GOBL::Currency::ExchangeRate>]
      property :exchange_rates, [GOBL::Currency::ExchangeRate]

      # @!attribute [r] preceding
      # Key information regarding previous invoices and potentially details as to why they were corrected.
      # @return [Array<GOBL::Org::DocumentRef>]
      property :preceding, [GOBL::Org::DocumentRef]

      # @!attribute [r] tax
      # Special tax configuration for billing.
      # @return [Tax]
      property :tax, Tax

      # @!attribute [r] supplier
      # The taxable entity supplying the goods or services.
      # @return [GOBL::Org::Party]
      property :supplier, GOBL::Org::Party
      validates_presence_of :supplier

      # @!attribute [r] customer
      # Legal entity receiving the goods or services, may be nil in certain circumstances such as simplified invoices.
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
      # Ordering details including document references and buyer or seller parties.
      # @return [Ordering]
      property :ordering, Ordering

      # @!attribute [r] payment
      # Information on when, how, and to whom the invoice should be paid.
      # @return [Payment]
      property :payment, Payment

      # @!attribute [r] delivery
      # Specific details on delivery of the goods referenced in the invoice.
      # @return [Delivery]
      property :delivery, Delivery

      # @!attribute [r] totals
      # Summary of all the invoice totals, including taxes (calculated).
      # @return [Totals]
      property :totals, Totals

      # @!attribute [r] notes
      # Unstructured information that is relevant to the invoice, such as correction or additional legal details.
      # @return [Array<GOBL::CBC::Note>]
      property :notes, [GOBL::CBC::Note]

      # @!attribute [r] complements
      # Additional complementary objects that add relevant information to the invoice.
      # @return [Array<GOBL::Schema::Object>]
      property :complements, [GOBL::Schema::Object]

      # @!attribute [r] meta
      # Additional semi-structured data that doesn't fit into the body of the invoice.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
