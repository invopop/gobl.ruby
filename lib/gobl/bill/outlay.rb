# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # Outlay represents a reimbursable expense that was paid for by the supplier and invoiced separately by the third party directly to the customer.
    class Outlay < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Outlay'

      # Unique identity for this outlay.
      attribute? :uuid, GOBL::UUID::UUID.optional

      # Outlay number index inside the invoice for ordering (calculated).
      attribute? :i, GOBL::Types::Int.optional

      # When was the outlay made.
      attribute? :date, GOBL::Cal::Date.optional

      # Invoice number or other reference detail used to identify the outlay.
      attribute? :code, GOBL::Types::String.optional

      # Series of the outlay invoice.
      attribute? :series, GOBL::Types::String.optional

      # Details on what the outlay was.
      attribute :desc, GOBL::Types::String

      # Who was the supplier of the outlay
      attribute? :supplier, GOBL::Org::Party.optional

      # Amount paid by the supplier.
      attribute :amount, GOBL::Types.Constructor(GOBL::Num::Amount)

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          i: data['i'],
          date: data['date'] ? GOBL::Cal::Date.from_gobl!(data['date']) : nil,
          code: data['code'],
          series: data['series'],
          desc: data['desc'],
          supplier: data['supplier'] ? GOBL::Org::Party.from_gobl!(data['supplier']) : nil,
          amount: data['amount']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'i' => attributes[:i],
          'date' => attributes[:date]&.to_gobl,
          'code' => attributes[:code],
          'series' => attributes[:series],
          'desc' => attributes[:desc],
          'supplier' => attributes[:supplier]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl
        }.compact
      end
    end
  end
end

