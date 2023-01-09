# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.34.1
##

module GOBL
  module Tax
    # SourceKey identifies the source of a tax identity
    class SourceKey < GOBL::Enum
      # The Schema ID of the GOBL SourceKey structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/identity#/$defs/SourceKey'

      # The enumeration of values of the object and their descriptions (Values different to these are not allowed)
      ENUM = {
        'tax-agency' => 'Sourced directly from a tax agency',
        'passport' => 'A passport document',
        'national' => 'National ID Card or similar',
        'permit' => 'Residential or similar permit',
        'other' => 'An other type of source not listed'
      }.freeze

      def strict_enum?
        true
      end
    end
  end
end
