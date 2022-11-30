# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.32.0
##

module GOBL
  module Cal
    # Period represents two dates with a start and finish.
    class Period < GOBL::Object
      # The Schema ID of the GOBL Period structure
      SCHEMA_ID = 'https://gobl.org/draft-0/cal/period'

      # @!attribute [r] start
      # @return [GOBL::Cal::Date]
      property :start, GOBL::Cal::Date
      validates :start, presence: true

      # @!attribute [r] end
      # @return [GOBL::Cal::Date]
      property :end, GOBL::Cal::Date
      validates :end, presence: true
    end
  end
end
