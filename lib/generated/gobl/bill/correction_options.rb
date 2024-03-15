# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.69.0
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

      # @!attribute [r] stamps
      # Stamps of the previous document to include in the preceding data.
      # @return [Array<GOBL::Head::Stamp>]
      property :stamps, [GOBL::Head::Stamp]

      # @!attribute [r] reason
      # Human readable reason for the corrective operation.
      # @return [String]
      property :reason, String

      # @!attribute [r] ext
      # Extensions for region specific requirements.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions
    end
  end
end
