# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Pay
    # CreditTransfer contains fields that can be used for making payments via a bank transfer or wire.
    class CreditTransfer < GOBL::Struct
      # The Schema ID of the GOBL CreditTransfer structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/CreditTransfer'

      # @!attribute [r] iban
      # International Bank Account Number
      # @return [String]
      attribute? :iban, GOBL::Types::String.optional

      # @!attribute [r] bic
      # Bank Identifier Code used for international transfers.
      # @return [String]
      attribute? :bic, GOBL::Types::String.optional

      # @!attribute [r] number
      # Account number, if IBAN not available.
      # @return [String]
      attribute? :number, GOBL::Types::String.optional

      # @!attribute [r] name
      # Name of the bank.
      # @return [String]
      attribute? :name, GOBL::Types::String.optional

      # @!attribute [r] branch
      # Bank office branch address, not normally required.
      # @return [GOBL::Org::Address]
      attribute? :branch, GOBL::Org::Address.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [CreditTransfer] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          iban: data['iban'],
          bic: data['bic'],
          number: data['number'],
          name: data['name'],
          branch: data['branch'] ? GOBL::Org::Address.from_gobl!(data['branch']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'iban' => attributes[:iban],
          'bic' => attributes[:bic],
          'number' => attributes[:number],
          'name' => attributes[:name],
          'branch' => attributes[:branch]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {CreditTransfer} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [CreditTransfer] the object corresponding to the given input
    end
  end
end

