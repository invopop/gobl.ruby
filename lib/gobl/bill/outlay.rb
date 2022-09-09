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

      # @!attribute [r] uuid
      # Unique identity for this outlay.
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] i
      # Outlay number index inside the invoice for ordering (calculated).
      # @return [Integer]
      attribute? :i, GOBL::Types::Int.optional

      # @!attribute [r] date
      # When was the outlay made.
      # @return [GOBL::Cal::Date]
      attribute? :date, GOBL::Cal::Date.optional

      # @!attribute [r] code
      # Invoice number or other reference detail used to identify the outlay.
      # @return [String]
      attribute? :code, GOBL::Types::String.optional

      # @!attribute [r] series
      # Series of the outlay invoice.
      # @return [String]
      attribute? :series, GOBL::Types::String.optional

      # @!attribute [r] desc
      # Details on what the outlay was.
      # @return [String]
      attribute :desc, GOBL::Types::String

      # @!attribute [r] supplier
      # Who was the supplier of the outlay
      # @return [GOBL::Org::Party]
      attribute? :supplier, GOBL::Org::Party.optional

      # @!attribute [r] amount
      # Amount paid by the supplier.
      # @return [GOBL::Num::Amount]
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

