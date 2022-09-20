# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Telephone describes what is expected for a telephone number.
    class Telephone < GOBL::Struct
      # The Schema ID of the GOBL Telephone structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/telephone'

      # @!attribute [r] uuid
      # Unique identity code
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] label
      # Identifier for this number.
      # @return [String]
      attribute? :label, GOBL::Types::String.optional

      # @!attribute [r] num
      # The number to be dialed in ITU E.164 international format.
      # @return [String]
      attribute :num, GOBL::Types::String

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Telephone] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          label: data['label'],
          num: data['num']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'label' => attributes[:label],
          'num' => attributes[:num]
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Telephone} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Telephone] the object corresponding to the given input
    end
  end
end

