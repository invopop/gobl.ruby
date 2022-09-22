# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.3
##


module GOBL
  module Bill
    # Outlay represents a reimbursable expense that was paid for by the supplier and invoiced separately by the third party directly to the customer.
    class Outlay < GOBL::Struct
      # The Schema ID of the GOBL Outlay structure
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

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Outlay] the object created from the given data
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

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
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

      # @!method self.new(attrs)
      #
      #   Returns a {Outlay} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Outlay] the object corresponding to the given input
    end
  end
end

