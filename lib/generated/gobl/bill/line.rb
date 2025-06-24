# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # Line is a single row in an invoice.
    class Line < GOBL::Object
      # The Schema ID of the GOBL Line structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/line'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] i
      # Line number inside the parent (calculated)
      # @return [Integer]
      property :i, Integer

      # @!attribute [r] quantity
      # Number of items
      # @return [GOBL::Num::Amount]
      property :quantity, GOBL::Num::Amount
      validates_presence_of :quantity

      # @!attribute [r] identifier
      # Single identifier provided by the supplier for an object on which the line item is based and is not considered a universal identity. Examples include a subscription number, telephone number, meter point, etc. Utilize the label property to provide a description of the identifier.
      # @return [GOBL::Org::Identity]
      property :identifier, GOBL::Org::Identity

      # @!attribute [r] period
      # A period of time relevant to when the service or item is delivered.
      # @return [GOBL::Cal::Period]
      property :period, GOBL::Cal::Period

      # @!attribute [r] order
      # Order reference for a specific line within a purchase order provided by the buyer.
      # @return [GOBL::CBC::Code]
      property :order, GOBL::CBC::Code

      # @!attribute [r] cost
      # Buyer accounting reference cost code to associate with the line.
      # @return [GOBL::CBC::Code]
      property :cost, GOBL::CBC::Code

      # @!attribute [r] item
      # Details about the item, service or good, that is being sold
      # @return [GOBL::Org::Item]
      property :item, GOBL::Org::Item
      validates_presence_of :item

      # @!attribute [r] breakdown
      # Breakdown of the line item for more detailed information. The sum of all lines will be used for the item price.
      # @return [Array<SubLine>]
      property :breakdown, [SubLine]

      # @!attribute [r] sum
      # Result of quantity multiplied by the item's price (calculated)
      # @return [GOBL::Num::Amount]
      property :sum, GOBL::Num::Amount

      # @!attribute [r] discounts
      # Discounts applied to this line
      # @return [Array<LineDiscount>]
      property :discounts, [LineDiscount]

      # @!attribute [r] charges
      # Charges applied to this line
      # @return [Array<LineCharge>]
      property :charges, [LineCharge]

      # @!attribute [r] taxes
      # Map of taxes to be applied and used in the invoice totals
      # @return [GOBL::Tax::Set]
      property :taxes, GOBL::Tax::Set

      # @!attribute [r] total
      # Total line amount after applying discounts to the sum (calculated).
      # @return [GOBL::Num::Amount]
      property :total, GOBL::Num::Amount

      # @!attribute [r] substituted
      # List of substituted lines. Useful for deliveries or corrective documents in order to indicate to the recipient which of the requested lines are being replaced. This is for purely informative purposes, and will not be used for calculations.
      # @return [Array<SubLine>]
      property :substituted, [SubLine]

      # @!attribute [r] notes
      # Set of specific notes for this line that may be required for clarification.
      # @return [Array<GOBL::Org::Note>]
      property :notes, [GOBL::Org::Note]

      # @!attribute [r] ext
      # Extension codes that apply to the line
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions
    end
  end
end
