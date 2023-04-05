# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.42.0
##

module GOBL
  module Bill
    # Outlay represents a reimbursable expense that was paid for by the supplier and invoiced separately by the third party directly to the customer.
    class Outlay < GOBL::Object
      # The Schema ID of the GOBL Outlay structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Outlay'

      # @!attribute [r] uuid
      # Unique identity for this outlay.
      # @return [GOBL::UUID::UUID]
      property :uuid, GOBL::UUID::UUID

      # @!attribute [r] i
      # Outlay number index inside the invoice for ordering (calculated).
      # @return [Integer]
      property :i, Integer

      # @!attribute [r] date
      # When was the outlay made.
      # @return [GOBL::Cal::Date]
      property :date, GOBL::Cal::Date

      # @!attribute [r] code
      # Invoice number or other reference detail used to identify the outlay.
      # @return [String]
      property :code, String

      # @!attribute [r] series
      # Series of the outlay invoice.
      # @return [String]
      property :series, String

      # @!attribute [r] desc
      # Details on what the outlay was.
      # @return [String]
      property :desc, String
      validates_presence_of :desc

      # @!attribute [r] supplier
      # Who was the supplier of the outlay
      # @return [GOBL::Org::Party]
      property :supplier, GOBL::Org::Party

      # @!attribute [r] amount
      # Amount paid by the supplier.
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount
      validates_presence_of :amount
    end
  end
end
