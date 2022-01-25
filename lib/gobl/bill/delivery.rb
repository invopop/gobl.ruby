# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Delivery < Dry::Struct
      # The party who will receive delivery of the goods defined in the invoice and is not responsible for taxes.
      attribute :receiver, GOBL::Org::Party.optional

      # When the goods should be expected
      attribute :date, GOBL::Org::Date.optional

      # Start of a n invoicing or delivery period
      attribute :start_date, GOBL::Org::Date.optional

      # End of a n invoicing or delivery period
      attribute :end_date, GOBL::Org::Date.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          receiver: gobl['receiver'] ? GOBL::Org::Party.from_gobl!(gobl['receiver']) : nil,
          date: gobl['date'] ? GOBL::Org::Date.from_gobl!(gobl['date']) : nil,
          start_date: gobl['start_date'] ? GOBL::Org::Date.from_gobl!(gobl['start_date']) : nil,
          end_date: gobl['end_date'] ? GOBL::Org::Date.from_gobl!(gobl['end_date']) : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'receiver' => attributes[:receiver]&.to_gobl,
          'date' => attributes[:date]&.to_gobl,
          'start_date' => attributes[:start_date]&.to_gobl,
          'end_date' => attributes[:end_date]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
