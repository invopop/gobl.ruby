# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

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

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          iban: gobl['iban'],
          bic: gobl['bic'],
          number: gobl['number'],
          name: gobl['name'],
          branch: gobl['branch'] ? GOBL::Org::Address.from_gobl!(gobl['branch']) : nil,
          notes: gobl['notes'],
          meta: gobl['meta']
        )
      end

      def to_gobl
        {
          'iban' => attributes[:iban],
          'bic' => attributes[:bic],
          'number' => attributes[:number],
          'name' => attributes[:name],
          'branch' => attributes[:branch],
          'notes' => attributes[:notes],
          'meta' => attributes[:meta]
        }
      end
    end
  end
end
