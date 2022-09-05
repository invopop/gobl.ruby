# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # Delivery covers the details of the destination for the products described in the invoice body.
    class Delivery < GOBL::Struct
      # The party who will receive delivery of the goods defined in the invoice and is not responsible for taxes.
      attribute :receiver, GOBL::Org::Party.optional

      # When the goods should be expected
      attribute :date, GOBL::Cal::Date.optional

      # Start of a n invoicing or delivery period
      attribute :start_date, GOBL::Cal::Date.optional

      # End of a n invoicing or delivery period
      attribute :end_date, GOBL::Cal::Date.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          receiver: data['receiver'] ? GOBL::Org::Party.from_gobl!(data['receiver']) : nil,
          date: data['date'] ? GOBL::Cal::Date.from_gobl!(data['date']) : nil,
          start_date: data['start_date'] ? GOBL::Cal::Date.from_gobl!(data['start_date']) : nil,
          end_date: data['end_date'] ? GOBL::Cal::Date.from_gobl!(data['end_date']) : nil
        )
      end

      def to_gobl
        {
          'receiver' => attributes[:receiver]&.to_gobl,
          'date' => attributes[:date]&.to_gobl,
          'start_date' => attributes[:start_date]&.to_gobl,
          'end_date' => attributes[:end_date]&.to_gobl
        }
      end
    end
  end
end

