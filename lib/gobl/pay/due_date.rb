# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
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
      attribute :amount, GOBL::Types.Constructor(GOBL::Num::Amount)

      # Percentage of the total that should be paid by the date.
      attribute :percent, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      # If different from the parent document's base currency.
      attribute :currency, GOBL::Currency::Code.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          date: GOBL::Cal::Date.from_gobl!(data['date']),
          notes: data['notes'],
          amount: data['amount'],
          percent: data['percent'] ? data['percent'] : nil,
          currency: data['currency'] ? GOBL::Currency::Code.from_gobl!(data['currency']) : nil
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
          'currency' => attributes[:currency]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

