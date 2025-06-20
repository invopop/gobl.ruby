# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # SubLine provides a simplified line that can be embedded inside other lines to provide a more detailed breakdown of the items being sold or substituted.
    class SubLine < GOBL::Object
      # The Schema ID of the GOBL SubLine structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/line#/$defs/SubLine'

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

      # @!attribute [r] sum
      # Result of quantity multiplied by the item's price (calculated)
      # @return [GOBL::Num::Amount]
      property :sum, GOBL::Num::Amount

      # @!attribute [r] discounts
      # Discounts applied to this sub-line
      # @return [Array<LineDiscount>]
      property :discounts, [LineDiscount]

      # @!attribute [r] charges
      # Charges applied to this sub-line
      # @return [Array<LineCharge>]
      property :charges, [LineCharge]

      # @!attribute [r] total
      # Total sub-line amount after applying discounts to the sum (calculated).
      # @return [GOBL::Num::Amount]
      property :total, GOBL::Num::Amount

      # @!attribute [r] notes
      # Set of specific notes for this sub-line that may be required for clarification.
      # @return [Array<GOBL::Org::Note>]
      property :notes, [GOBL::Org::Note]
    end
  end
end
