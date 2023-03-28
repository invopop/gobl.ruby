# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.39.0
##

module GOBL
  module Tax
    # PrecedingDefinitions contains details about what can be defined in Invoice preceding document data.
    class PrecedingDefinitions < GOBL::Object
      # The Schema ID of the GOBL PrecedingDefinitions structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime#/$defs/PrecedingDefinitions'

      # @!attribute [r] corrections
      # Corrections contains a list of all the keys that can be used to identify a correction.
      # @return [Array<KeyDefinition>]
      property :corrections, [KeyDefinition]

      # @!attribute [r] correction_methods
      # CorrectionMethods describe the methods used to correct an invoice.
      # @return [Array<KeyDefinition>]
      property :correction_methods, [KeyDefinition]
    end
  end
end