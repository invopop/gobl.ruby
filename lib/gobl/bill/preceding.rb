# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.32.0
##

module GOBL
  module Bill
    # Preceding allows for information to be provided about a previous invoice that this one will replace or subtract from.
    class Preceding < GOBL::Object
      # The Schema ID of the GOBL Preceding structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Preceding'

      # @!attribute [r] uuid
      # Preceding document's UUID if available can be useful for tracing.
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] series
      # Series identification code
      # @return [String]
      property :series, String

      # @!attribute [r] code
      # Code of the previous document.
      # @return [String]
      property :code, String
      validates :code, presence: true

      # @!attribute [r] issue_date
      # The issue date if the previous document.
      # @return [GOBL::Cal::Date]
      property :issue_date, GOBL::Cal::Date
      validates :issue_date, presence: true

      # @!attribute [r] period
      # Tax period in which the previous invoice had an effect.
      # @return [GOBL::Cal::Period]
      property :period, GOBL::Cal::Period

      # @!attribute [r] corrections
      # Specific codes for the corrections made.
      # @return [Array<String>]
      property :corrections, [String]

      # @!attribute [r] correction_method
      # How has the previous invoice been corrected?
      # @return [String]
      property :correction_method, String

      # @!attribute [r] notes
      # Additional details regarding preceding invoice
      # @return [String]
      property :notes, String

      # @!attribute [r] meta
      # Additional semi-structured data that may be useful in specific regions
      # @return [GOBL::Org::Meta]
      property :meta, GOBL::Org::Meta
    end
  end
end
