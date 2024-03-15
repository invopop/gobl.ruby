# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.69.0
##

module GOBL
  module Bill
    # Payment contains details as to how the invoice should be paid.
    class Payment < GOBL::Object
      # The Schema ID of the GOBL Payment structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Payment'

      # @!attribute [r] payee
      # The party responsible for receiving payment of the invoice, if not the supplier.
      # @return [GOBL::Org::Party]
      property :payee, GOBL::Org::Party

      # @!attribute [r] terms
      # Payment terms or conditions.
      # @return [GOBL::Pay::Terms]
      property :terms, GOBL::Pay::Terms

      # @!attribute [r] advances
      # Any amounts that have been paid in advance and should be deducted from the amount due.
      # @return [Array<GOBL::Pay::Advance>]
      property :advances, [GOBL::Pay::Advance]

      # @!attribute [r] instructions
      # Details on how payment should be made.
      # @return [GOBL::Pay::Instructions]
      property :instructions, GOBL::Pay::Instructions
    end
  end
end
