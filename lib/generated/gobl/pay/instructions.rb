# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.50.1
##

module GOBL
  module Pay
    # Instructions determine how the payment has or should be made.
    class Instructions < GOBL::Object
      # The Schema ID of the GOBL Instructions structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions'

      # Enumeration of possible values for {#key} with their corresponding descriptions
      KEY_ENUM = {
        'any' => 'Any method available, no preference.',
        'card' => 'Credit or debit card.',
        'credit-transfer' => 'Sender initiated bank or wire transfer.',
        'debit-transfer' => 'Receiver initiated bank or wire transfer.',
        'cash' => 'Cash in hand.',
        'cheque' => 'Cheque from bank.',
        'credit' => 'Using credit from previous transactions with the supplier.',
        'bank-draft' => 'Bankers Draft or Bank Cheque.',
        'direct-debit' => 'Direct debit from the customers bank account.',
        'online' => 'Online or web payment.'
      }.freeze

      # @!attribute [r] key
      # How payment is expected or has been arranged to be collected
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key
      validates_presence_of :key
      validates_inclusion_of :key, in: KEY_ENUM.keys

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
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
