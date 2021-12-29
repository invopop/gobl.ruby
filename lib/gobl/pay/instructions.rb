# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Pay
    class Instructions < Dry::Struct
      # How payment is expected or has been arranged to be collected.
      attribute :code, GOBL::Types::String

      # Optional text description of the payment method.
      attribute :detail, GOBL::Types::String.optional

      # Remittance information
      attribute :ref, GOBL::Types::String.optional

      # Instructions for sending payment via a bank transfer.
      attribute :credit_transfer, GOBL::Types::Array(GOBL::Pay::CreditTransfer).optional

      # Details of the payment that will be made via a credit or debit card.
      attribute :card, GOBL::Pay::Card.optional

      # A group of terms that can be used by the customer or payer to consolidate direct debit payments.
      attribute :direct_debit, GOBL::Pay::DirectDebit.optional

      # Array of online payment options.
      attribute :online, GOBL::Types::Array(GOBL::Pay::Online).optional

      # Any additional instructions that may be required to make the payment.
      attribute :notes, GOBL::Types::String.optional

      # Non-structured additional data that may be useful.
      attribute :instructions_meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          code: gobl['code'],
          detail: gobl['detail'],
          ref: gobl['ref'],
          credit_transfer: gobl['credit_transfer']&.map { |x| GOBL::Pay::CreditTransfer.from_gobl!(x) },
          card: gobl['card'] ? GOBL::Pay::Card.from_gobl!(gobl['card']) : nil,
          direct_debit: gobl['direct_debit'] ? GOBL::Pay::DirectDebit.from_gobl!(gobl['direct_debit']) : nil,
          online: gobl['online']&.map { |x| GOBL::Pay::Online.from_gobl!(x) },
          notes: gobl['notes'],
          instructions_meta: gobl['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'detail' => attributes[:detail],
          'ref' => attributes[:ref],
          'credit_transfer' => attributes[:credit_transfer]&.map { |x| x&.to_gobl },
          'card' => attributes[:card]&.to_gobl,
          'direct_debit' => attributes[:direct_debit]&.to_gobl,
          'online' => attributes[:online]&.map { |x| x&.to_gobl },
          'notes' => attributes[:notes],
          'meta' => attributes[:instructions_meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
