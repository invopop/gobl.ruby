# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Pay
    class CreditTransfer < Dry::Struct
      # International Bank Account Number
      attribute :iban, GOBL::Types::String.optional

      # Bank Identifier Code used for international transfers.
      attribute :bic, GOBL::Types::String.optional

      # Account number
      attribute :number, GOBL::Types::String.optional

      # Name of the bank.
      attribute :name, GOBL::Types::String.optional

      # Bank office branch address
      attribute :branch, GOBL::Org::Address.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          iban: gobl['iban'],
          bic: gobl['bic'],
          number: gobl['number'],
          name: gobl['name'],
          branch: gobl['branch'] ? GOBL::Org::Address.from_gobl!(gobl['branch']) : nil
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
