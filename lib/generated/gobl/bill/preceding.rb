# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.69.0
##

module GOBL
  module Bill
    # Preceding allows for information to be provided about a previous invoice that this one will replace, subtract from, or add to.
    class Preceding < GOBL::Object
      # The Schema ID of the GOBL Preceding structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Preceding'

      # @!attribute [r] uuid
      # Preceding document's UUID if available can be useful for tracing.
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # Enumeration of possible values for {#type} with their corresponding descriptions
      TYPE_ENUM = {
        'standard' => 'A regular commercial invoice document between a supplier and customer.',
        'proforma' => 'For a clients validation before sending a final invoice.',
        'corrective' => 'Corrected invoice that completely *replaces* the preceding document.',
        'credit-note' => 'Reflects a refund either partial or complete of the preceding document. A 
      credit note effectively *extends* the previous document.',
        'debit-note' => 'An additional set of charges to be added to the preceding document.'
      }.freeze

      # @!attribute [r] type
      # Type of the preceding document
      # @return [GOBL::CBC::Key]
      property :type, GOBL::CBC::Key
      validates_inclusion_of :type, in: TYPE_ENUM.keys, allow_blank: true

      # @!attribute [r] series
      # Series identification code
      # @return [String]
      property :series, String

      # @!attribute [r] code
      # Code of the previous document.
      # @return [String]
      property :code, String
      validates_presence_of :code

      # @!attribute [r] issue_date
      # The issue date of the previous document.
      # @return [GOBL::Cal::Date]
      property :issue_date, GOBL::Cal::Date

      # @!attribute [r] reason
      # Human readable description on why the preceding invoice is being replaced.
      # @return [String]
      property :reason, String

      # @!attribute [r] stamps
      # Seals of approval from other organisations that may need to be listed.
      # @return [Array<GOBL::Head::Stamp>]
      property :stamps, [GOBL::Head::Stamp]

      # @!attribute [r] period
      # Tax period in which the previous invoice had an effect required by some tax regimes and formats.
      # @return [GOBL::Cal::Period]
      property :period, GOBL::Cal::Period

      # @!attribute [r] ext
      # Extensions for region specific requirements.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

      # @!attribute [r] meta
      # Additional semi-structured data that may be useful in specific regions
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
