# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # LineCharge represents an amount added to the line, and will be applied before taxes.
    class LineCharge < GOBL::Object
      # The Schema ID of the GOBL LineCharge structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/line#/$defs/LineCharge'

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
      # Key for grouping or identifying charges for tax purposes. A suggested list of keys is provided, but these are for reference only and may be extended by the issuer.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] code
      # Reference or ID for this charge defined by the issuer
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] reason
      # Text description as to why the charge was applied
      # @return [String]
      property :reason, String

      # @!attribute [r] base
      # Base for percent calculations instead of the line's sum
      # @return [GOBL::Num::Amount]
      property :base, GOBL::Num::Amount

      # @!attribute [r] percent
      # Percentage of base or parent line's sum
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] quantity
      # Quantity of units to apply the charge to when using the rate instead of the line's quantity.
      # @return [GOBL::Num::Amount]
      property :quantity, GOBL::Num::Amount

      # @!attribute [r] unit
      # Unit to associate with the quantity when using the rate.
      # @return [GOBL::Org::Unit]
      property :unit, GOBL::Org::Unit

      # @!attribute [r] rate
      # Rate defines a price per unit to use instead of the percentage.
      # @return [GOBL::Num::Amount]
      property :rate, GOBL::Num::Amount

      # @!attribute [r] amount
      # Fixed or resulting charge amount to apply (calculated if percent present).
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount

      # @!attribute [r] ext
      # Extension codes that apply to the charge
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions
    end
  end
end
