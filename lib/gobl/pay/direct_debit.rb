# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Pay
    # DirectDebit defines the data that will be used to make the direct debit.
    class DirectDebit < GOBL::Struct
      # The Schema ID of the GOBL DirectDebit structure
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

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [DirectDebit] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          ref: data['ref'],
          creditor: data['creditor'],
          account: data['account']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'ref' => attributes[:ref],
          'creditor' => attributes[:creditor],
          'account' => attributes[:account]
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {DirectDebit} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   The `new` method will only allow to create a new object if all attributes
      #   marked as mandatory and not calculated in the JSON schema are provided.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [DirectDebit] the object corresponding to the given input
    end
  end
end

