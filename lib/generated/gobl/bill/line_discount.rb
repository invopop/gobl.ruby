# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # LineDiscount represents an amount deducted from the line, and will be applied before taxes.
    class LineDiscount < GOBL::Object
      # The Schema ID of the GOBL LineDiscount structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/line#/$defs/LineDiscount'

      # Enumeration of possible values for {#key} with their corresponding descriptions
      KEY_ENUM = {
        'early-completion' => 'Bonus for works ahead of schedule',
        'military' => 'Military Discount',
        'work-accident' => 'Work Accident Discount',
        'special-agreement' => 'Special Agreement Discount',
        'production-error' => 'Production Error Discount',
        'new-outlet' => 'New Outlet Discount',
        'sample' => 'Sample Discount',
        'end-of-range' => 'End of Range Discount',
        'incoterm' => 'Incoterm Discount',
        'pos-threshold' => 'Point of Sale Threshold Discount',
        'special-rebate' => 'Special Rebate',
        'temporary' => 'Temporary',
        'standard' => 'Standard',
        'yearly-turnover' => 'Yearly Turnover'
      }.freeze

      # @!attribute [r] key
      # Key for identifying the type of discount being applied.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] code
      # Code or reference for this discount defined by the issuer
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] reason
      # Text description as to why the discount was applied
      # @return [String]
      property :reason, String

      # @!attribute [r] base
      # Base for percent calculations instead of the line's sum.
      # @return [GOBL::Num::Amount]
      property :base, GOBL::Num::Amount

      # @!attribute [r] percent
      # Percentage to apply to the base or line sum to calculate the discount amount
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] amount
      # Fixed discount amount to apply (calculated if percent present)
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount

      # @!attribute [r] ext
      # Extension codes that apply to the discount
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions
    end
  end
end
