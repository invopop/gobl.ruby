# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # A Payment is used to link an invoice or invoices with a payment transaction.
    class Payment < GOBL::Object
      # The Schema ID of the GOBL Payment structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/payment'

      # Enumeration of possible values for {#$regime} with their corresponding descriptions
      $REGIME_ENUM = {
        'AE' => 'United Arab Emirates',
        'AT' => 'Austria',
        'BE' => 'Belgium',
        'BR' => 'Brazil',
        'CA' => 'Canada',
        'CH' => 'Switzerland',
        'CO' => 'Colombia',
        'DE' => 'Germany',
        'EL' => 'Greece',
        'ES' => 'Spain',
        'FR' => 'France',
        'GB' => 'United Kingdom',
        'IE' => 'Ireland',
        'IN' => 'India',
        'IT' => 'Italy',
        'MX' => 'Mexico',
        'NL' => 'The Netherlands',
        'PL' => 'Poland',
        'PT' => 'Portugal',
        'SE' => 'Sweden',
        'SG' => 'Singapore',
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
      # Tags are used to help identify specific tax scenarios or requirements that may apply changes to the contents of the document or imply a specific meaning. Converters may use tags to help identify specific situations that do not have a specific extension, for example; self-billed or partial invoices may be identified by their respective tags.
      # @return [Array<GOBL::CBC::Key>]
      property :$tags, [GOBL::CBC::Key]

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # Enumeration of possible values for {#type} with their corresponding descriptions
      TYPE_ENUM = {
        'request' => 'A payment request sent from the supplier to a customer indicating that they are
      requesting a transfer of funds from the customer directly or a payer.
      This is used to request payment for specific documents and invoices.',
        'advice' => 'A remittance advice sent from the customer to the supplier reflecting that payment for
      the referenced documents has been made.',
        'receipt' => 'A payment receipt sent from the supplier to a customer indicating that they have
      received a transfer of funds from the customer directly or a payer.
      This is the default payment type and may be required by some tax
      regimes in order to communicate the payment of specific documents and invoices.'
      }.freeze

      # @!attribute [r] type
      # Type of payment document being issued.
      # @return [GOBL::CBC::Key]
      property :type, GOBL::CBC::Key
      validates_inclusion_of :type, in: TYPE_ENUM.keys, allow_blank: true

      # @!attribute [r] method
      # Details on how the payment was made based on the original instructions.
      # @return [GOBL::Pay::Instructions]
      property :method, GOBL::Pay::Instructions

      # @!attribute [r] series
      # Series is used to identify groups of payments by date, business area, project, type, customer, a combination of any, or other company specific data. If the output format does not support the series as a separate field, it will be prepended to the code for presentation with a dash (`-`) for separation.
      # @return [GOBL::CBC::Code]
      property :series, GOBL::CBC::Code

      # @!attribute [r] code
      # Code is a sequential identifier that uniquely identifies the payment. The code can be left empty initially, but is **required** to **sign** the document.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] issue_date
      # When the payment was issued.
      # @return [GOBL::Cal::Date]
      property :issue_date, GOBL::Cal::Date

      # @!attribute [r] issue_time
      # IssueTime is an optional field that may be useful to indicate the time of day when the payment was issued.
      # @return [GOBL::Cal::Time]
      property :issue_time, GOBL::Cal::Time

      # @!attribute [r] value_date
      # When the taxes of this payment become accountable, if none set, the issue date is assumed.
      # @return [GOBL::Cal::Date]
      property :value_date, GOBL::Cal::Date

      # @!attribute [r] currency
      # Currency for all payment totals.
      # @return [GOBL::Currency::Code]
      property :currency, GOBL::Currency::Code

      # @!attribute [r] exchange_rates
      # Exchange rates to be used when converting the payment's monetary values into other currencies.
      # @return [Array<GOBL::Currency::ExchangeRate>]
      property :exchange_rates, [GOBL::Currency::ExchangeRate]

      # @!attribute [r] ext
      # Extensions for additional codes that may be required.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

      # @!attribute [r] preceding
      # Key information regarding previous versions of this document.
      # @return [Array<GOBL::Org::DocumentRef>]
      property :preceding, [GOBL::Org::DocumentRef]

      # @!attribute [r] supplier
      # The taxable entity who is responsible for supplying goods or services.
      # @return [GOBL::Org::Party]
      property :supplier, GOBL::Org::Party
      validates_presence_of :supplier

      # @!attribute [r] customer
      # Legal entity that receives the goods or services.
      # @return [GOBL::Org::Party]
      property :customer, GOBL::Org::Party

      # @!attribute [r] payee
      # Legal entity that receives the payment if not the supplier.
      # @return [GOBL::Org::Party]
      property :payee, GOBL::Org::Party

      # @!attribute [r] lines
      # List of documents that are being paid for.
      # @return [Array<PaymentLine>]
      property :lines, [PaymentLine]
      validates_presence_of :lines

      # @!attribute [r] ordering
      # Ordering allows for additional information about the ordering process including references to other documents and alternative parties involved in the order-to-delivery process.
      # @return [GOBL::Bill::Ordering]
      property :ordering, GOBL::Bill::Ordering

      # @!attribute [r] total
      # Total amount to be paid in this payment, either positive or negative according to the line types and totals. Calculated automatically.
      # @return [GOBL::Num::Amount]
      property :total, GOBL::Num::Amount
      validates_presence_of :total

      # @!attribute [r] notes
      # Unstructured information that is relevant to the payment, such as correction or additional legal details.
      # @return [Array<GOBL::Org::Note>]
      property :notes, [GOBL::Org::Note]

      # @!attribute [r] complements
      # Additional complementary objects that add relevant information to the payment.
      # @return [Array<GOBL::Schema::Object>]
      property :complements, [GOBL::Schema::Object]

      # @!attribute [r] meta
      # Additional semi-structured data that doesn't fit into the body of the invoice.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
