# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Bill
    # Delivery covers the details of the destination for the products described in the invoice body.
    class Delivery < GOBL::Struct
      # The Schema ID of the GOBL Delivery structure
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

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Delivery] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          receiver: data['receiver'] ? GOBL::Org::Party.from_gobl!(data['receiver']) : nil,
          date: data['date'] ? GOBL::Cal::Date.from_gobl!(data['date']) : nil,
          start_date: data['start_date'] ? GOBL::Cal::Date.from_gobl!(data['start_date']) : nil,
          end_date: data['end_date'] ? GOBL::Cal::Date.from_gobl!(data['end_date']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'receiver' => attributes[:receiver]&.to_gobl,
          'date' => attributes[:date]&.to_gobl,
          'start_date' => attributes[:start_date]&.to_gobl,
          'end_date' => attributes[:end_date]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Delivery} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   The `new` method will only allow to create a new object if all attributes
      #   marked as mandatory and not calculated in the JSON schema are provided.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Delivery] the object corresponding to the given input
    end
  end
end

