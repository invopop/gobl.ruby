# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Pay
    class BankTransfer < Model::Struct
      # International Bank Account Number
      attribute :iban, Model::Types::String.optional

      # Bank Identifier Code used for international transfers.
      attribute :bic, Model::Types::String.optional

      # Account number
      attribute :number, Model::Types::String.optional

      # Name of the bank.
      attribute :name, Model::Types::String.optional

      # Bank office branch address
      attribute :branch, GOBL::Org::Address.optional

      # Any additional instructions that may be required to make the transfer.
      attribute :notes, (Model::Types::Hash | Model::Types::Nil).optional

      # Non-structured additional data that may be useful.
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
