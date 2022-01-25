# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Pay
    class Advance < Dry::Struct
      # Unique identifier for this advance.
      attribute :uuid, GOBL::UUID::UUID.optional

      # When the advance was made.
      attribute :date, GOBL::Org::Date.optional

      # ID or reference for the advance.
      attribute :ref, GOBL::Types::String.optional

      # If this "advance" payment has come from a public grant or subsidy, set this to true.
      attribute :grant, GOBL::Types::Bool.optional

      # Details about the advance.
      attribute :desc, GOBL::Types::String

      # How much as a percentage of the total with tax was paid
      attribute :rate, GOBL::Num::Percentage.optional

      # How much was paid.
      attribute :amount, GOBL::Num::Amount

      # If different from the parent document's base currency.
      attribute :currency, GOBL::Types::String.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          date: gobl['date'] ? GOBL::Org::Date.from_gobl!(gobl['date']) : nil,
          ref: gobl['ref'],
          grant: gobl['grant'],
          desc: gobl['desc'],
          rate: gobl['rate'] ? GOBL::Num::Percentage.from_gobl!(gobl['rate']) : nil,
          amount: GOBL::Num::Amount.from_gobl!(gobl['amount']),
          currency: gobl['currency']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'date' => attributes[:date]&.to_gobl,
          'ref' => attributes[:ref],
          'grant' => attributes[:grant],
          'desc' => attributes[:desc],
          'rate' => attributes[:rate]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl,
          'currency' => attributes[:currency]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
