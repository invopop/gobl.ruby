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
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Delivery'

      # @!attribute [r] receiver
      # The party who will receive delivery of the goods defined in the invoice and is not responsible for taxes.
      # @return [GOBL::Org::Party]
      attribute? :receiver, GOBL::Org::Party.optional

      # @!attribute [r] date
      # When the goods should be expected
      # @return [GOBL::Cal::Date]
      attribute? :date, GOBL::Cal::Date.optional

      # @!attribute [r] start_date
      # Start of a n invoicing or delivery period
      # @return [GOBL::Cal::Date]
      attribute? :start_date, GOBL::Cal::Date.optional

      # @!attribute [r] end_date
      # End of a n invoicing or delivery period
      # @return [GOBL::Cal::Date]
      attribute? :end_date, GOBL::Cal::Date.optional

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
        }.compact
      end
    end
  end
end

