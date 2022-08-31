# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

require 'dry-struct'

module GOBL
  module Pay
    # CreditTransfer contains fields that can be used for making payments via a bank transfer or wire.
    class CreditTransfer < Dry::Struct
      # International Bank Account Number
      attribute? :iban, GOBL::Types::String.optional

      # Bank Identifier Code used for international transfers.
      attribute? :bic, GOBL::Types::String.optional

      # Account number, if IBAN not available.
      attribute? :number, GOBL::Types::String.optional

      # Name of the bank.
      attribute? :name, GOBL::Types::String.optional

      # Bank office branch address, not normally required.
      attribute? :branch, GOBL::Org::Address.optional

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

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'iban' => attributes[:iban],
          'bic' => attributes[:bic],
          'number' => attributes[:number],
          'name' => attributes[:name],
          'branch' => attributes[:branch]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

