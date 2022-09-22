# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Bill
    # Line is a single row in an invoice.
    class Line < GOBL::Struct
      # The Schema ID of the GOBL Line structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Line'

      # @!attribute [r] uuid
      # Unique identifier for this line
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] i
      # Line number inside the parent (calculated)
      # @return [Integer]
      attribute? :i, GOBL::Types::Int.optional

      # @!attribute [r] quantity
      # Number of items
      # @return [GOBL::Num::Amount]
      attribute :quantity, GOBL::Types.Constructor(GOBL::Num::Amount)

      # @!attribute [r] item
      # Details about what is being sold
      # @return [GOBL::Org::Item]
      attribute :item, GOBL::Org::Item

      # @!attribute [r] sum
      # Result of quantity multiplied by the item's price (calculated)
      # @return [GOBL::Num::Amount]
      attribute? :sum, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # @!attribute [r] discounts
      # Discounts applied to this line
      # @return [Array<LineDiscount>]
      attribute? :discounts, GOBL::Types::Array.of(LineDiscount).optional

      # @!attribute [r] charges
      # Charges applied to this line
      # @return [Array<LineCharge>]
      attribute? :charges, GOBL::Types::Array.of(LineCharge).optional

      # @!attribute [r] taxes
      # Map of taxes to be applied and used in the invoice totals
      # @return [GOBL::Tax::Set]
      attribute? :taxes, GOBL::Tax::Set.optional

      # @!attribute [r] total
      # Total line amount after applying discounts to the sum (calculated).
      # @return [GOBL::Num::Amount]
      attribute? :total, GOBL::Types.Constructor(GOBL::Num::Amount).optional

      # @!attribute [r] notes
      # Set of specific notes for this line that may be required for clarification.
      # @return [Array<GOBL::Org::Note>]
      attribute? :notes, GOBL::Types::Array.of(GOBL::Org::Note).optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Line] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          i: data['i'],
          quantity: data['quantity'],
          item: GOBL::Org::Item.from_gobl!(data['item']),
          sum: data['sum'] ? data['sum'] : nil,
          discounts: data['discounts']&.map { |item| LineDiscount.from_gobl!(item) },
          charges: data['charges']&.map { |item| LineCharge.from_gobl!(item) },
          taxes: data['taxes'] ? GOBL::Tax::Set.from_gobl!(data['taxes']) : nil,
          total: data['total'] ? data['total'] : nil,
          notes: data['notes']&.map { |item| GOBL::Org::Note.from_gobl!(item) }
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'i' => attributes[:i],
          'quantity' => attributes[:quantity]&.to_gobl,
          'item' => attributes[:item]&.to_gobl,
          'sum' => attributes[:sum]&.to_gobl,
          'discounts' => attributes[:discounts]&.map { |item| item&.to_gobl },
          'charges' => attributes[:charges]&.map { |item| item&.to_gobl },
          'taxes' => attributes[:taxes]&.to_gobl,
          'total' => attributes[:total]&.to_gobl,
          'notes' => attributes[:notes]&.map { |item| item&.to_gobl }
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Line} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Line] the object corresponding to the given input
    end
  end
end

