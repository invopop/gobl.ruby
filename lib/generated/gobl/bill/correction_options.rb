# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.55.0
##

module GOBL
  module Bill
    # CorrectionOptions defines a structure used to pass configuration options to correct a previous invoice.
    class CorrectionOptions < GOBL::Object
      # The Schema ID of the GOBL CorrectionOptions structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/correction-options'

      # @!attribute [r] issue_date
      # When the new corrective invoice's issue date should be set to.
      # @return [GOBL::Cal::Date]
      property :issue_date, GOBL::Cal::Date

      # @!attribute [r] stamps
      # Stamps of the previous document to include in the preceding data.
      # @return [Array<GOBL::CBC::Stamp>]
      property :stamps, [GOBL::CBC::Stamp]

      # @!attribute [r] credit
      # Credit when true indicates that the corrective document should cancel the previous document.
      # @return [Boolean]
      property :credit, Boolean

      # @!attribute [r] debit
      # Debit when true indicates that the corrective document should add new items to the previous document.
      # @return [Boolean]
      property :debit, Boolean

      # @!attribute [r] reason
      # Human readable reason for the corrective operation.
      # @return [String]
      property :reason, String

      # @!attribute [r] correction_method
      # Correction method as defined by the tax regime.
      # @return [GOBL::CBC::Key]
      property :correction_method, GOBL::CBC::Key

      # @!attribute [r] corrections
      # Correction keys that describe the specific changes according to the tax regime.
      # @return [Array<GOBL::CBC::Key>]
      property :corrections, [GOBL::CBC::Key]
    end
  end
end
