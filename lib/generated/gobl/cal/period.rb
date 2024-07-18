# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Cal
    # Period represents two dates with a start and finish.
    class Period < GOBL::Object
      # The Schema ID of the GOBL Period structure
      SCHEMA_ID = 'https://gobl.org/draft-0/cal/period'

      # @!attribute [r] label
      # Label is a short description of the period.
      # @return [String]
      property :label, String

      # @!attribute [r] start
      # Start indicates when this period starts.
      # @return [GOBL::Cal::Date]
      property :start, GOBL::Cal::Date
      validates_presence_of :start

      # @!attribute [r] end
      # End indicates when the period ends, and must be after the start date.
      # @return [GOBL::Cal::Date]
      property :end, GOBL::Cal::Date
      validates_presence_of :end
    end
  end
end
