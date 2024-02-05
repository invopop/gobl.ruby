# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.67.0
##

module GOBL
  module Pay
    # DirectDebit defines the data that will be used to make the direct debit.
    class DirectDebit < GOBL::Object
      # The Schema ID of the GOBL DirectDebit structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/DirectDebit'

      # @!attribute [r] ref
      # Unique identifier assigned by the payee for referencing the direct debit.
      # @return [String]
      property :ref, String

      # @!attribute [r] creditor
      # Unique banking reference that identifies the payee or seller assigned by the bank.
      # @return [String]
      property :creditor, String

      # @!attribute [r] account
      # Account identifier to be debited by the direct debit.
      # @return [String]
      property :account, String
    end
  end
end
