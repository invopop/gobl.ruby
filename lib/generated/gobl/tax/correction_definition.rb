# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # CorrectionDefinition contains details about what can be defined in .
    class CorrectionDefinition < GOBL::Object
      # The Schema ID of the GOBL CorrectionDefinition structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime-def#/$defs/CorrectionDefinition'

      # @!attribute [r] schema
      # Partial or complete schema URL for the document type supported by correction.
      # @return [String]
      property :schema, String
      validates_presence_of :schema

      # @!attribute [r] types
      # The types of sub-documents supported by the regime
      # @return [Array<GOBL::CBC::Key>]
      property :types, [GOBL::CBC::Key]

      # @!attribute [r] extensions
      # Extension keys that can be included
      # @return [Array<GOBL::CBC::Key>]
      property :extensions, [GOBL::CBC::Key]

      # @!attribute [r] reason_required
      # ReasonRequired when true implies that a reason must be provided
      # @return [Boolean]
      property :reason_required, Boolean

      # @!attribute [r] stamps
      # Stamps that must be copied from the preceding document.
      # @return [Array<GOBL::CBC::Key>]
      property :stamps, [GOBL::CBC::Key]

      # @!attribute [r] copy_tax
      # Copy tax from the preceding document to the document ref.
      # @return [Boolean]
      property :copy_tax, Boolean
    end
  end
end
