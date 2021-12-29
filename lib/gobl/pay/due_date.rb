# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Pay
    class DueDate < Dry::Struct
      # When the payment is due.
      attribute :date, GOBL::Org::Date

      # Other details to take into account for the due date.
      attribute :notes, GOBL::Types::String.optional

      # How much needs to be paid by the date.
      attribute :amount, GOBL::Num::Amount

      # Percentage of the total that should be paid by the date.
      attribute :percent, GOBL::Num::Percentage.optional

      # If different from the parent document's base currency.
      attribute :currency, GOBL::Types::String.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          date: GOBL::Org::Date.from_gobl!(gobl['date']),
          notes: gobl['notes'],
          amount: GOBL::Num::Amount.from_gobl!(gobl['amount']),
          percent: gobl['percent'] ? GOBL::Num::Percentage.from_gobl!(gobl['percent']) : nil,
          currency: gobl['currency']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'date' => attributes[:date]&.to_gobl,
          'notes' => attributes[:notes],
          'amount' => attributes[:amount]&.to_gobl,
          'percent' => attributes[:percent]&.to_gobl,
          'currency' => attributes[:currency]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
