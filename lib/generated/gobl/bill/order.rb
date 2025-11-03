# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # Order documents are used for the initial part of a order-to-invoice process where the buyer requests goods or services from the seller.
    class Order < GOBL::Object
      # The Schema ID of the GOBL Order structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/order'

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
        'purchase' => 'A purchase order is a document that a buyer sends to a seller to request goods or services.',
        'sale' => 'A sales order is a document that a seller sends to a buyer to confirm the sale of goods or services.',
        'quote' => 'A quote is a document that a seller sends to a buyer to provide a price for goods or services.'
      }.freeze

      # @!attribute [r] type
      # Type of the order.
      # @return [GOBL::CBC::Key]
      property :type, GOBL::CBC::Key
      validates_inclusion_of :type, in: TYPE_ENUM.keys, allow_blank: true

      # @!attribute [r] series
      # Series is used to identify groups of orders by date, business area, project, type, customer, a combination of any, or other company specific data. If the output format does not support the series as a separate field, it will be prepended to the code for presentation with a dash (`-`) for separation.
      # @return [GOBL::CBC::Code]
      property :series, GOBL::CBC::Code

      # @!attribute [r] code
      # Code is a sequential identifier that uniquely identifies the order. The code can be left empty initially, but is **required** to **sign** the document.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] issue_date
      # When the invoice was created.
      # @return [GOBL::Cal::Date]
      property :issue_date, GOBL::Cal::Date

      # @!attribute [r] issue_time
      # IssueTime is an optional field that may be useful to indicate the time of day when the order was issued. Some regions and formats may require this field to be set. An empty string will be automatically updated to reflect the current time, otherwise the field can be left with a nil value.
      # @return [GOBL::Cal::Time]
      property :issue_time, GOBL::Cal::Time

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

      # @!attribute [r] contracts
      # The identification of contracts.
      # @return [Array<GOBL::Org::DocumentRef>]
      property :contracts, [GOBL::Org::DocumentRef]

      # @!attribute [r] preceding
      # Key information regarding previous order documents.
      # @return [Array<GOBL::Org::DocumentRef>]
      property :preceding, [GOBL::Org::DocumentRef]

      # @!attribute [r] identities
      # Additional codes, IDs, SKUs, or other regional or custom identifiers that may be used to identify the order.
      # @return [Array<GOBL::Org::Identity>]
      property :identities, [GOBL::Org::Identity]

      # @!attribute [r] period
      # Period of time in which the order is valid.
      # @return [GOBL::Cal::Period]
      property :period, GOBL::Cal::Period

      # @!attribute [r] tax
      # Special tax configuration for billing.
      # @return [GOBL::Bill::Tax]
      property :tax, GOBL::Bill::Tax

      # @!attribute [r] supplier
      # The entity supplying the goods or services and usually responsible for paying taxes.
      # @return [GOBL::Org::Party]
      property :supplier, GOBL::Org::Party
      validates_presence_of :supplier

      # @!attribute [r] customer
      # Legal entity receiving the goods or services, may be nil in certain circumstances such as simplified invoices.
      # @return [GOBL::Org::Party]
      property :customer, GOBL::Org::Party

      # @!attribute [r] buyer
      # Party who is responsible for issuing payment, if not the same as the customer.
      # @return [GOBL::Org::Party]
      property :buyer, GOBL::Org::Party

      # @!attribute [r] seller
      # Seller is the party liable to pay taxes on the transaction if not the same as the supplier.
      # @return [GOBL::Org::Party]
      property :seller, GOBL::Org::Party

      # @!attribute [r] lines
      # List of lines representing each of the items to be ordered.
      # @return [Array<GOBL::Bill::Line>]
      property :lines, [GOBL::Bill::Line]

      # @!attribute [r] discounts
      # Discounts or allowances applied to order totals
      # @return [Array<GOBL::Bill::Discount>]
      property :discounts, [GOBL::Bill::Discount]

      # @!attribute [r] charges
      # Charges or surcharges applied to order totals
      # @return [Array<GOBL::Bill::Charge>]
      property :charges, [GOBL::Bill::Charge]

      # @!attribute [r] payment
      # Information on when, how, and to whom a final invoice would be paid.
      # @return [GOBL::Bill::PaymentDetails]
      property :payment, GOBL::Bill::PaymentDetails

      # @!attribute [r] delivery
      # Specific details on delivery of the goods to copy to the final invoice.
      # @return [GOBL::Bill::DeliveryDetails]
      property :delivery, GOBL::Bill::DeliveryDetails

      # @!attribute [r] totals
      # Summary of all the order totals, including taxes (calculated).
      # @return [GOBL::Bill::Totals]
      property :totals, GOBL::Bill::Totals

      # @!attribute [r] notes
      # Unstructured information that is relevant to the order, such as correction or additional legal details.
      # @return [Array<GOBL::Org::Note>]
      property :notes, [GOBL::Org::Note]

      # @!attribute [r] complements
      # Additional complementary objects that add relevant information to the order.
      # @return [Array<GOBL::Schema::Object>]
      property :complements, [GOBL::Schema::Object]

      # @!attribute [r] meta
      # Additional semi-structured data that doesn't fit into the body of the order.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta

      # @!attribute [r] attachments
      # Attachments provide additional information or supporting documents that are not included in the main document. It is important that attachments are not used for alternative versions of the PDF, for that, see "links" inside the envelope headers.
      # @return [Array<GOBL::Org::Attachment>]
      property :attachments, [GOBL::Org::Attachment]
    end
  end
end
