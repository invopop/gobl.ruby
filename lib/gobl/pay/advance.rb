# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Pay
    # Advance represents a single payment that has been made already, such as a deposit on an intent to purchase, or as credit from a previous invoice which was later corrected or cancelled.
    class Advance < GOBL::Struct
      # The Schema ID of the GOBL Advance structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/advance'

      # @!attribute [r] uuid
      # Unique identifier for this advance.
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] date
      # When the advance was made.
      # @return [GOBL::Cal::Date]
      attribute? :date, GOBL::Cal::Date.optional

      # @!attribute [r] ref
      # ID or reference for the advance.
      # @return [String]
      attribute? :ref, GOBL::Types::String.optional

      # @!attribute [r] grant
      # If this "advance" payment has come from a public grant or subsidy, set this to true.
      # @return [Boolean]
      attribute? :grant, GOBL::Types::Bool.optional

      # @!attribute [r] desc
      # Details about the advance.
      # @return [String]
      attribute :desc, GOBL::Types::String

      # @!attribute [r] percent
      # How much as a percentage of the total with tax was paid
      # @return [GOBL::Num::Percentage]
      attribute? :percent, GOBL::Types.Constructor(GOBL::Num::Percentage).optional

      # @!attribute [r] amount
      # How much was paid.
      # @return [GOBL::Num::Amount]
      attribute :amount, GOBL::Types.Constructor(GOBL::Num::Amount)

      # @!attribute [r] currency
      # If different from the parent document's base currency.
      # @return [GOBL::Currency::Code]
      attribute? :currency, GOBL::Currency::Code.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Advance] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          date: data['date'] ? GOBL::Cal::Date.from_gobl!(data['date']) : nil,
          ref: data['ref'],
          grant: data['grant'],
          desc: data['desc'],
          percent: data['percent'] ? data['percent'] : nil,
          amount: data['amount'],
          currency: data['currency'] ? GOBL::Currency::Code.from_gobl!(data['currency']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'date' => attributes[:date]&.to_gobl,
          'ref' => attributes[:ref],
          'grant' => attributes[:grant],
          'desc' => attributes[:desc],
          'percent' => attributes[:percent]&.to_gobl,
          'amount' => attributes[:amount]&.to_gobl,
          'currency' => attributes[:currency]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Advance} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Advance] the object corresponding to the given input
    end
  end
end

