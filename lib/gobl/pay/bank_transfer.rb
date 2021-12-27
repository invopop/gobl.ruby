# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Pay
    class BankTransfer < GOBL::Struct
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

      # Any additional instructions that may be required to make the transfer.
      attribute :notes, GOBL::I18n::String.optional

      # Non-structured additional data that may be useful.
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          iban: gobl['iban'],
          bic: gobl['bic'],
          number: gobl['number'],
          name: gobl['name'],
          branch: gobl['branch'] ? GOBL::Org::Address.from_gobl!(gobl['branch']) : nil,
          notes: gobl['notes'] ? GOBL::I18n::String.from_gobl!(gobl['notes']) : nil,
          meta: gobl['meta']
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
          'branch' => attributes[:branch]&.to_gobl,
          'notes' => attributes[:notes]&.to_gobl,
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
