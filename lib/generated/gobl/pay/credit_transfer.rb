# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.55.0
##

module GOBL
  module Pay
    # CreditTransfer contains fields that can be used for making payments via a bank transfer or wire.
    class CreditTransfer < GOBL::Object
      # The Schema ID of the GOBL CreditTransfer structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/CreditTransfer'

      # @!attribute [r] iban
      # International Bank Account Number
      # @return [String]
      property :iban, String

      # @!attribute [r] bic
      # Bank Identifier Code used for international transfers.
      # @return [String]
      property :bic, String

      # @!attribute [r] number
      # Account number, if IBAN not available.
      # @return [String]
      property :number, String

      # @!attribute [r] name
      # Name of the bank.
      # @return [String]
      property :name, String

      # @!attribute [r] branch
      # Bank office branch address, not normally required.
      # @return [GOBL::Org::Address]
      property :branch, GOBL::Org::Address
    end
  end
end
