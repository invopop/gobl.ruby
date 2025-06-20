# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # Charge represents a surchange applied to the complete document independent from the individual lines.
    class Charge < GOBL::Object
      # The Schema ID of the GOBL Charge structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/charge'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] i
      # Line number inside the list of charges (calculated).
      # @return [Integer]
      property :i, Integer

      # Enumeration of possible values for {#key} with their corresponding descriptions
      KEY_ENUM = {
        'stamp-duty' => 'Stamp Duty',
        'outlay' => 'Outlay',
        'tax' => 'Tax',
        'customs' => 'Customs',
        'delivery' => 'Delivery',
        'packing' => 'Packing',
        'handling' => 'Handling',
        'insurance' => 'Insurance',
        'storage' => 'Storage',
        'admin' => 'Administration',
        'cleaning' => 'Cleaning'
      }.freeze

      # @!attribute [r] key
      # Key for grouping or identifying charges for tax purposes. A suggested list of keys is provided, but these may be extended by the issuer.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] code
      # Code to used to refer to the this charge by the issuer
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] reason
      # Text description as to why the charge was applied
      # @return [String]
      property :reason, String

      # @!attribute [r] base
      # Base represents the value used as a base for percent calculations instead of the invoice's sum of lines.
      # @return [GOBL::Num::Amount]
      property :base, GOBL::Num::Amount

      # @!attribute [r] percent
      # Percentage to apply to the sum of all lines
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] amount
      # Amount to apply (calculated if percent present)
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount

      # @!attribute [r] taxes
      # List of taxes to apply to the charge
      # @return [GOBL::Tax::Set]
      property :taxes, GOBL::Tax::Set

      # @!attribute [r] ext
      # Extension codes that apply to the charge
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

      # @!attribute [r] meta
      # Additional semi-structured information.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
