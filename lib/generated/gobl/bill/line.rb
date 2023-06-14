# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.50.5
##

module GOBL
  module Bill
    # Line is a single row in an invoice.
    class Line < GOBL::Object
      # The Schema ID of the GOBL Line structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Line'

      # @!attribute [r] uuid
      # Unique identifier for this line
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] i
      # Line number inside the parent (calculated)
      # @return [Integer]
      property :i, Integer

      # @!attribute [r] quantity
      # Number of items
      # @return [GOBL::Num::Amount]
      property :quantity, GOBL::Num::Amount
      validates_presence_of :quantity

      # @!attribute [r] item
      # Details about what is being sold
      # @return [GOBL::Org::Item]
      property :item, GOBL::Org::Item
      validates_presence_of :item

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

      # @!attribute [r] notes
      # Set of specific notes for this line that may be required for clarification.
      # @return [Array<GOBL::CBC::Note>]
      property :notes, [GOBL::CBC::Note]
    end
  end
end
