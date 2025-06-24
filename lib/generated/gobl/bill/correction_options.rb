# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # CorrectionOptions defines a structure used to pass configuration options to correct a previous invoice.
    class CorrectionOptions < GOBL::Object
      # The Schema ID of the GOBL CorrectionOptions structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/correction-options'

      # @!attribute [r] type
      # The type of corrective invoice to produce.
      # @return [GOBL::CBC::Key]
      property :type, GOBL::CBC::Key
      validates_presence_of :type

      # @!attribute [r] issue_date
      # When the new corrective invoice's issue date should be set to.
      # @return [GOBL::Cal::Date]
      property :issue_date, GOBL::Cal::Date

      # @!attribute [r] series
      # Series to assign to the new corrective invoice.
      # @return [GOBL::CBC::Code]
      property :series, GOBL::CBC::Code

      # @!attribute [r] stamps
      # Stamps of the previous document to include in the preceding data.
      # @return [Array<GOBL::Head::Stamp>]
      property :stamps, [GOBL::Head::Stamp]

      # @!attribute [r] reason
      # Human readable reason for the corrective operation.
      # @return [String]
      property :reason, String

      # @!attribute [r] ext
      # Extensions for region specific requirements that may be added in the preceding or at the document level, according to the local rules.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

      # @!attribute [r] copy_tax
      # CopyTax when true will copy the tax totals from the previous document to the preceding document data.
      # @return [Boolean]
      property :copy_tax, Boolean
    end
  end
end
