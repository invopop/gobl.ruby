# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.32.0
##

module GOBL
  module Bill
    # Defines an invoice type according to a subset of the UNTDID 1001 standard list.
    class InvoiceType < GOBL::Enum
      # The Schema ID of the GOBL InvoiceType structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/InvoiceType'

      # The enumeration of values of the object and their descriptions (Values different to these are not allowed)
      ENUM = {
        'proforma' => 'Proforma invoice, for a clients validation before sending a final invoice.',
        'simplified' => 'Simplified invoice or receipt typically used for small transactions that dont require customer details.t require customer details.',
        'partial' => 'Partial invoice',
        'commercial' => 'Commercial invoice, usually cross-border transactions requiring an invoice for customs.',
        'corrected' => 'Corrected invoice',
        'credit-note' => 'Credit note',
        'self-billed' => 'Self billed invoice'
      }.freeze

      def strict_enum?
        true
      end
    end
  end
end
