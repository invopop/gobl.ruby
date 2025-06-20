# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # Discount represents an allowance applied to the complete document independent from the individual lines.
    class Discount < GOBL::Object
      # The Schema ID of the GOBL Discount structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/discount'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] i
      # Line number inside the list of discounts (calculated)
      # @return [Integer]
      property :i, Integer

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
      # Code to used to refer to the this discount by the issuer
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] reason
      # Text description as to why the discount was applied
      # @return [String]
      property :reason, String

      # @!attribute [r] base
      # Base represents the value used as a base for percent calculations instead of the invoice's sum of lines.
      # @return [GOBL::Num::Amount]
      property :base, GOBL::Num::Amount

      # @!attribute [r] percent
      # Percentage to apply to the base or invoice's sum.
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] amount
      # Amount to apply (calculated if percent present).
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount

      # @!attribute [r] taxes
      # List of taxes to apply to the discount
      # @return [GOBL::Tax::Set]
      property :taxes, GOBL::Tax::Set

      # @!attribute [r] ext
      # Extension codes that apply to the discount
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

      # @!attribute [r] meta
      # Additional semi-structured information.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
