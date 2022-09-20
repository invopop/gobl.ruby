# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Pay
    # Instructions holds a set of instructions that determine how the payment has or should be made.
    class Instructions < GOBL::Struct
      # The Schema ID of the GOBL Instructions structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions'

      # @!attribute [r] key
      # How payment is expected or has been arranged to be collected
      # @return [MethodKey]
      attribute :key, MethodKey

      # @!attribute [r] detail
      # Optional text description of the payment method
      # @return [String]
      attribute? :detail, GOBL::Types::String.optional

      # @!attribute [r] ref
      # Remittance information, a text value used to link the payment with the invoice.
      # @return [String]
      attribute? :ref, GOBL::Types::String.optional

      # @!attribute [r] credit_transfer
      # Instructions for sending payment via a bank transfer.
      # @return [Array<CreditTransfer>]
      attribute? :credit_transfer, GOBL::Types::Array.of(CreditTransfer).optional

      # @!attribute [r] card
      # Details of the payment that will be made via a credit or debit card.
      # @return [Card]
      attribute? :card, Card.optional

      # @!attribute [r] direct_debit
      # A group of terms that can be used by the customer or payer to consolidate direct debit payments.
      # @return [DirectDebit]
      attribute? :direct_debit, DirectDebit.optional

      # @!attribute [r] online
      # Array of online payment options
      # @return [Array<Online>]
      attribute? :online, GOBL::Types::Array.of(Online).optional

      # @!attribute [r] notes
      # Any additional instructions that may be required to make the payment.
      # @return [String]
      attribute? :notes, GOBL::Types::String.optional

      # @!attribute [r] meta
      # Non-structured additional data that may be useful.
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Instructions] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          key: MethodKey.from_gobl!(data['key']),
          detail: data['detail'],
          ref: data['ref'],
          credit_transfer: data['credit_transfer']&.map { |item| CreditTransfer.from_gobl!(item) },
          card: data['card'] ? Card.from_gobl!(data['card']) : nil,
          direct_debit: data['direct_debit'] ? DirectDebit.from_gobl!(data['direct_debit']) : nil,
          online: data['online']&.map { |item| Online.from_gobl!(item) },
          notes: data['notes'],
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'key' => attributes[:key]&.to_gobl,
          'detail' => attributes[:detail],
          'ref' => attributes[:ref],
          'credit_transfer' => attributes[:credit_transfer]&.map { |item| item&.to_gobl },
          'card' => attributes[:card]&.to_gobl,
          'direct_debit' => attributes[:direct_debit]&.to_gobl,
          'online' => attributes[:online]&.map { |item| item&.to_gobl },
          'notes' => attributes[:notes],
          'meta' => attributes[:meta]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Instructions} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Instructions] the object corresponding to the given input
    end
  end
end

