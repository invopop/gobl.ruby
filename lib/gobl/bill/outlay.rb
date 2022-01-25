# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Outlay < Dry::Struct
      # Unique identity for this outlay.
      attribute :uuid, GOBL::Types::String.optional

      # Outlay number index inside the invoice for ordering.
      attribute :i, GOBL::Types::Int

      # When was the outlay made.
      attribute :date, GOBL::Org::Date.optional

      # Invoice number or other reference detail used to identify the outlay.
      attribute :code, GOBL::Types::String.optional

      # Series of the outlay invoice.
      attribute :series, GOBL::Types::String.optional

      # Details on what the outlay was.
      attribute :desc, GOBL::Types::String

      # Who was the supplier of the outlay
      attribute :supplier, GOBL::Org::Party.optional

      # Amount paid by the supplier.
      attribute :amount, GOBL::Num::Amount

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          i: gobl['i'],
          date: gobl['date'] ? GOBL::Org::Date.from_gobl!(gobl['date']) : nil,
          code: gobl['code'],
          series: gobl['series'],
          desc: gobl['desc'],
          supplier: gobl['supplier'] ? GOBL::Org::Party.from_gobl!(gobl['supplier']) : nil,
          amount: GOBL::Num::Amount.from_gobl!(gobl['amount'])
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
          'i' => attributes[:i],
          'date' => attributes[:date]&.to_gobl,
          'code' => attributes[:code],
          'series' => attributes[:series],
          'desc' => attributes[:desc],
          'supplier' => attributes[:supplier]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
