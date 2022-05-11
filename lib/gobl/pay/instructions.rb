# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Pay
    # Instructions holds a set of instructions that determine how the payment has or should be made.
    class Instructions < Dry::Struct
      # How payment is expected or has been arranged to be collected.
      attribute :code, GOBL::Types::String

      # Optional text description of the payment method.
      attribute :detail, GOBL::Types::String.optional

      # Remittance information
      attribute :ref, GOBL::Types::String.optional

      # Instructions for sending payment via a bank transfer.
      attribute :credit_transfer, GOBL::Types::Array.of(CreditTransfer).optional

      # Details of the payment that will be made via a credit or debit card.
      attribute :card, Card.optional

      # A group of terms that can be used by the customer or payer to consolidate direct debit payments.
      attribute :direct_debit, DirectDebit.optional

      # Array of online payment options.
      attribute :online, GOBL::Types::Array.of(Online).optional

      # Any additional instructions that may be required to make the payment.
      attribute :notes, GOBL::Types::String.optional

      # Non-structured additional data that may be useful.
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          code: data['code'],
          detail: data['detail'],
          ref: data['ref'],
          credit_transfer: data['credit_transfer']&.map { |item| CreditTransfer.from_gobl!(item) },
          card: data['card'] ? Card.from_gobl!(data['card']) : nil,
          direct_debit: data['direct_debit'] ? DirectDebit.from_gobl!(data['direct_debit']) : nil,
          online: data['online']&.map { |item| Online.from_gobl!(item) },
          notes: data['notes'],
          meta: data['meta']
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
          'credit_transfer' => attributes[:credit_transfer]&.map { |item| item&.to_gobl },
          'card' => attributes[:card]&.to_gobl,
          'direct_debit' => attributes[:direct_debit]&.to_gobl,
          'online' => attributes[:online]&.map { |item| item&.to_gobl },
          'notes' => attributes[:notes],
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

