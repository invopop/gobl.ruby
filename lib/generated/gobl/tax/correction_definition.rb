# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.63.1
##

module GOBL
  module Tax
    # CorrectionDefinition contains details about what can be defined in .
    class CorrectionDefinition < GOBL::Object
      # The Schema ID of the GOBL CorrectionDefinition structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime#/$defs/CorrectionDefinition'

      # @!attribute [r] schema
      # Partial or complete schema URL for the document type supported by correction.
      # @return [String]
      property :schema, String
      validates_presence_of :schema

      # @!attribute [r] types
      # The types of sub-documents supported by the regime
      # @return [Array<GOBL::CBC::Key>]
      property :types, [GOBL::CBC::Key]

      # @!attribute [r] methods
      # Methods describe the methods used to correct an invoice.
      # @return [Array<KeyDefinition>]
      property :methods, [KeyDefinition]

      # @!attribute [r] changes
      # List of change keys that can be used to describe what has been corrected.
      # @return [Array<KeyDefinition>]
      property :changes, [KeyDefinition]

      # @!attribute [r] reason_required
      # ReasonRequired when true implies that a reason must be provided
      # @return [Boolean]
      property :reason_required, Boolean

      # @!attribute [r] stamps
      # Stamps that must be copied from the preceding document.
      # @return [Array<GOBL::CBC::Key>]
      property :stamps, [GOBL::CBC::Key]
    end
  end
end
