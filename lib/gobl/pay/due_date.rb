# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Pay
    # DueDate contains an amount that should be paid by the given date.
    class DueDate < Dry::Struct
      # When the payment is due.
      attribute :date, GOBL::Cal::Date

      # Other details to take into account for the due date.
      attribute :notes, GOBL::Types::String.optional

      # How much needs to be paid by the date.
      attribute :amount, GOBL::Num::Amount

      # Percentage of the total that should be paid by the date.
      attribute :percent, GOBL::Num::Percentage.optional

      # If different from the parent document's base currency.
      attribute :currency, GOBL::Types::String.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          date: GOBL::Cal::Date.from_gobl!(data['date']),
          notes: data['notes'],
          amount: GOBL::Num::Amount.from_gobl!(data['amount']),
          percent: data['percent'] ? GOBL::Num::Percentage.from_gobl!(data['percent']) : nil,
          currency: data['currency']
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

