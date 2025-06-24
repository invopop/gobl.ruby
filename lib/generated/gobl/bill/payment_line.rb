# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # PaymentLine defines the details of a line item in a payment document.
    class PaymentLine < GOBL::Object
      # The Schema ID of the GOBL PaymentLine structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/payment#/$defs/PaymentLine'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] i
      # Line number within the parent document (automatically calculated)
      # @return [Integer]
      property :i, Integer

      # @!attribute [r] refund
      # Indicates whether this payment is a refund of a previous payment, effectively reversing the flow of funds between the supplier and customer or their representatives.
      # @return [Boolean]
      property :refund, Boolean

      # @!attribute [r] document
      # Reference to the document being paid
      # @return [GOBL::Org::DocumentRef]
      property :document, GOBL::Org::DocumentRef

      # @!attribute [r] installment
      # When making multiple payments for a single document, this specifies the installment number for this payment line.
      # @return [Integer]
      property :installment, Integer

      # @!attribute [r] description
      # Additional human readable description of the payment line which may be useful for explaining the purpose or special conditions. Notes should be used for more formal comments.
      # @return [String]
      property :description, String

      # @!attribute [r] payable
      # Payable reflects the amount of the document that is payable. This will be calculated from the embedded document's amount automatically and converted to the currency of the document.
      # @return [GOBL::Num::Amount]
      property :payable, GOBL::Num::Amount

      # @!attribute [r] advances
      # Amount already paid in previous installments, which may be required by some tax regimes or specific use cases.
      # @return [GOBL::Num::Amount]
      property :advances, GOBL::Num::Amount

      # @!attribute [r] amount
      # Amount of the total payment allocated to the referenced document.
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount
      validates_presence_of :amount

      # @!attribute [r] due
      # Due reflects how much still needs to be paid
      # @return [GOBL::Num::Amount]
      property :due, GOBL::Num::Amount

      # @!attribute [r] tax
      # Tax contains a breakdown of the taxes that will be applied to this payment line after taking into account currency conversion and the relative amounts.
      # @return [GOBL::Tax::Total]
      property :tax, GOBL::Tax::Total

      # @!attribute [r] notes
      # Additional notes specific to this line item for clarification purposes
      # @return [Array<GOBL::Org::Note>]
      property :notes, [GOBL::Org::Note]
    end
  end
end
