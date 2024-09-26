# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Pay
    # Advance represents a single payment that has been made already, such as a deposit on an intent to purchase, or as credit from a previous invoice which was later corrected or cancelled.
    class Advance < GOBL::Object
      # The Schema ID of the GOBL Advance structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/advance'

      # @!attribute [r] uuid
      # Universally Unique Identifier.
      # @return [String]
      property :uuid, String

      # @!attribute [r] date
      # When the advance was made.
      # @return [GOBL::Cal::Date]
      property :date, GOBL::Cal::Date

      # Enumeration of possible values for {#key} with their corresponding descriptions
      KEY_ENUM = {
        'any' => 'Any method available, no preference.',
        'card' => 'Payment card.',
        'credit-transfer' => 'Sender initiated bank or wire transfer.',
        'debit-transfer' => 'Receiver initiated bank or wire transfer.',
        'cash' => 'Cash in hand.',
        'cheque' => 'Cheque from bank.',
        'bank-draft' => 'Bankers Draft or Bank Cheque.',
        'direct-debit' => 'Direct debit from the customers bank account.',
        'online' => 'Online or web payment.',
        'promissory-note' => 'Promissory note contract.',
        'netting' => 'Intercompany clearing or clearing between partners.',
        'other' => 'Other or mutually defined means of payment.'
      }.freeze

      # @!attribute [r] key
      # The payment means used to make the advance.
      # @return [GOBL::CBC::Key]
      property :key, GOBL::CBC::Key

      # @!attribute [r] ref
      # ID or reference for the advance.
      # @return [String]
      property :ref, String

      # @!attribute [r] grant
      # If this "advance" payment has come from a public grant or subsidy, set this to true.
      # @return [Boolean]
      property :grant, Boolean

      # @!attribute [r] description
      # Details about the advance.
      # @return [String]
      property :description, String
      validates_presence_of :description

      # @!attribute [r] percent
      # How much as a percentage of the total with tax was paid
      # @return [GOBL::Num::Percentage]
      property :percent, GOBL::Num::Percentage

      # @!attribute [r] amount
      # How much was paid.
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount
      validates_presence_of :amount

      # @!attribute [r] currency
      # If different from the parent document's base currency.
      # @return [GOBL::Currency::Code]
      property :currency, GOBL::Currency::Code

      # @!attribute [r] card
      # Details of the payment that was made via a credit or debit card.
      # @return [Card]
      property :card, Card

      # @!attribute [r] credit_transfer
      # Details about how the payment was made by credit (bank) transfer.
      # @return [CreditTransfer]
      property :credit_transfer, CreditTransfer

      # @!attribute [r] ext
      # Tax extensions required by tax regimes or addons.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

      # @!attribute [r] meta
      # Additional details useful for the parties involved.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
