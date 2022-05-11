# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Pay
    # DirectDebit defines the data that will be used to make the direct debit.
    class DirectDebit < Dry::Struct
      # Unique identifier assigned by the payee for referencing the direct debit.
      attribute :ref, GOBL::Types::String.optional

      # Unique banking reference that identifies the payee or seller assigned by the bank.
      attribute :creditor, GOBL::Types::String.optional

      # Account identifier to be debited by the direct debit.
      attribute :account, GOBL::Types::String.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          ref: data['ref'],
          creditor: data['creditor'],
          account: data['account']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'ref' => attributes[:ref],
          'creditor' => attributes[:creditor],
          'account' => attributes[:account]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

