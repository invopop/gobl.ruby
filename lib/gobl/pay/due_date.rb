# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Pay
    # DueDate contains an amount that should be paid by the given date.
    class DueDate < GOBL::Struct
      # The Schema ID of the GOBL DueDate structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/terms#/$defs/DueDate'

      # @!attribute [r] date
      # When the payment is due.
      # @return [GOBL::Cal::Date]
      attribute :date, GOBL::Cal::Date

      # @!attribute [r] notes
      # Other details to take into account for the due date.
      # @return [String]
      attribute? :notes, GOBL::Types::String.optional

      # @!attribute [r] amount
      # How much needs to be paid by the date.
      # @return [GOBL::Num::Amount]
      attribute :amount, GOBL::Types.Constructor(GOBL::Num::Amount)

      # @!attribute [r] percent
      # Percentage of the total that should be paid by the date.
      # @return [GOBL::Num::Percentage]
      attribute? :percent, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      # @!attribute [r] currency
      # If different from the parent document's base currency.
      # @return [GOBL::Currency::Code]
      attribute? :currency, GOBL::Currency::Code.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [DueDate] the object created from the given data
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

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'date' => attributes[:date]&.to_gobl,
          'notes' => attributes[:notes],
          'amount' => attributes[:amount]&.to_gobl,
          'percent' => attributes[:percent]&.to_gobl,
          'currency' => attributes[:currency]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {DueDate} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   The `new` method will only allow to create a new object if all attributes
      #   marked as mandatory and not calculated in the JSON schema are provided.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [DueDate] the object corresponding to the given input
    end
  end
end

