# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Pay
    # DirectDebit defines the data that will be used to make the direct debit.
    class DirectDebit < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/DirectDebit'

      # @!attribute [r] ref
      # Unique identifier assigned by the payee for referencing the direct debit.
      # @return [String]
      attribute? :ref, GOBL::Types::String.optional

      # @!attribute [r] creditor
      # Unique banking reference that identifies the payee or seller assigned by the bank.
      # @return [String]
      attribute? :creditor, GOBL::Types::String.optional

      # @!attribute [r] account
      # Account identifier to be debited by the direct debit.
      # @return [String]
      attribute? :account, GOBL::Types::String.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          ref: data['ref'],
          creditor: data['creditor'],
          account: data['account']
        )
      end

      def to_gobl
        {
          'ref' => attributes[:ref],
          'creditor' => attributes[:creditor],
          'account' => attributes[:account]
        }.compact
      end
    end
  end
end

