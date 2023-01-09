# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.34.1
##

module GOBL
  module Pay
    # Instructions holds a set of instructions that determine how the payment has or should be made.
    class Instructions < GOBL::Object
      # The Schema ID of the GOBL Instructions structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions'

      # @!attribute [r] key
      # How payment is expected or has been arranged to be collected
      # @return [MethodKey]
      property :key, MethodKey
      validates :key, presence: true

      # @!attribute [r] detail
      # Optional text description of the payment method
      # @return [String]
      property :detail, String

      # @!attribute [r] ref
      # Remittance information, a text value used to link the payment with the invoice.
      # @return [String]
      property :ref, String

      # @!attribute [r] credit_transfer
      # Instructions for sending payment via a bank transfer.
      # @return [Array<CreditTransfer>]
      property :credit_transfer, [CreditTransfer]

      # @!attribute [r] card
      # Details of the payment that will be made via a credit or debit card.
      # @return [Card]
      property :card, Card

      # @!attribute [r] direct_debit
      # A group of terms that can be used by the customer or payer to consolidate direct debit payments.
      # @return [DirectDebit]
      property :direct_debit, DirectDebit

      # @!attribute [r] online
      # Array of online payment options
      # @return [Array<Online>]
      property :online, [Online]

      # @!attribute [r] notes
      # Any additional instructions that may be required to make the payment.
      # @return [String]
      property :notes, String

      # @!attribute [r] meta
      # Non-structured additional data that may be useful.
      # @return [GOBL::Org::Meta]
      property :meta, GOBL::Org::Meta
    end
  end
end
