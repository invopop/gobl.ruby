# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # Delivery document used to describe the delivery of goods or potentially also services.
    class Delivery < GOBL::Object
      # The Schema ID of the GOBL Delivery structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/delivery'

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
        'IN' => 'India',
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
        'advice' => 'A delivery or despatch advice document send by the supplier to indicate how
      an order is to be delivered.',
        'note' => 'A delivery note is a document accompanying a shipment of goods that lists the
      items included in the shipment.',
        'waybill' => 'A waybill is a document issued by a carrier giving details and instructions
      relating to the shipment of a consignment of goods.',
        'receipt' => 'A delivery receipt is a document that is signed by the person who receives
      goods to confirm that they have been received.'
      }.freeze

      # @!attribute [r] type
      # Type of delivery document.
      # @return [GOBL::CBC::Key]
      property :type, GOBL::CBC::Key
      validates_presence_of :type
      validates_inclusion_of :type, in: TYPE_ENUM.keys

      # @!attribute [r] series
      # Series is used to identify groups of deliveries by date, business area, project, type, customer, a combination of any, or other company specific data. If the output format does not support the series as a separate field, it will be prepended to the code for presentation with a dash (`-`) for separation.
      # @return [GOBL::CBC::Code]
      property :series, GOBL::CBC::Code

      # @!attribute [r] code
      # Code is a sequential identifier that uniquely identifies the delivery. The code can be left empty initially, but is **required** to **sign** the document.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] issue_date
      # When the delivery document is to be issued.
      # @return [GOBL::Cal::Date]
      property :issue_date, GOBL::Cal::Date

      # @!attribute [r] issue_time
      # IssueTime is an optional field that may be useful to indicate the time of day when the delivery was issued. Some regions and formats may require this field to be set. An empty string will be automatically updated to reflect the current time, otherwise the field can be left with a nil value.
      # @return [GOBL::Cal::Time]
      property :issue_time, GOBL::Cal::Time

      # @!attribute [r] value_date
      # When the taxes of this delivery become accountable, if none set, the issue date is used.
      # @return [GOBL::Cal::Date]
      property :value_date, GOBL::Cal::Date

      # @!attribute [r] currency
      # Currency for all delivery totals.
      # @return [GOBL::Currency::Code]
      property :currency, GOBL::Currency::Code

      # @!attribute [r] exchange_rates
      # Exchange rates to be used when converting the invoices monetary values into other currencies.
      # @return [Array<GOBL::Currency::ExchangeRate>]
      property :exchange_rates, [GOBL::Currency::ExchangeRate]

      # @!attribute [r] ordering
      # Ordering details for the delivery, including links to other documents.
      # @return [GOBL::Bill::Ordering]
      property :ordering, GOBL::Bill::Ordering

      # @!attribute [r] preceding
      # Key information regarding previous delivery documents that this one will either extend or replace.
      # @return [Array<GOBL::Org::DocumentRef>]
      property :preceding, [GOBL::Org::DocumentRef]

      # @!attribute [r] tracking
      # Tracking is used to define specific codes or IDs that may be used to identify and track delivery.
      # @return [Tracking]
      property :tracking, Tracking

      # @!attribute [r] despatch_date
      # DespatchDate is the date when the goods are expected to be despatched.
      # @return [GOBL::Cal::Date]
      property :despatch_date, GOBL::Cal::Date

      # @!attribute [r] receive_date
      # ReceiveDate is the date when the goods are expected to be received.
      # @return [GOBL::Cal::Date]
      property :receive_date, GOBL::Cal::Date

      # @!attribute [r] tax
      # Special tax configuration for calculating totals.
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

      # @!attribute [r] despatcher
      # The party who will despatch the goods defined in the invoice.
      # @return [GOBL::Org::Party]
      property :despatcher, GOBL::Org::Party

      # @!attribute [r] receiver
      # The party who will receive delivery of the goods defined in the invoice.
      # @return [GOBL::Org::Party]
      property :receiver, GOBL::Org::Party

      # @!attribute [r] courier
      # The courier responsible for delivering the goods.
      # @return [GOBL::Org::Party]
      property :courier, GOBL::Org::Party

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

      # @!attribute [r] totals
      # Summary of all the order totals, including taxes (calculated).
      # @return [GOBL::Bill::Totals]
      property :totals, GOBL::Bill::Totals

      # @!attribute [r] notes
      # Unstructured information that is relevant to the delivery, such as correction or additional legal details.
      # @return [Array<GOBL::Org::Note>]
      property :notes, [GOBL::Org::Note]

      # @!attribute [r] complements
      # Additional complementary objects that add relevant information to the delivery.
      # @return [Array<GOBL::Schema::Object>]
      property :complements, [GOBL::Schema::Object]

      # @!attribute [r] meta
      # Additional semi-structured data that doesn't fit into the body of the delivery.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta

      # @!attribute [r] attachments
      # Attachments provide additional information or supporting documents that are not included in the main document. It is important that attachments are not used for alternative versions of the PDF, for that, see "links" inside the envelope headers.
      # @return [Array<GOBL::Org::Attachment>]
      property :attachments, [GOBL::Org::Attachment]
    end
  end
end
