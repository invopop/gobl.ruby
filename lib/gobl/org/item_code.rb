# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Org
    # ItemCode contains a value and optional label property that means additional codes can be added to an item.
    class ItemCode < GOBL::Struct
      # The Schema ID of the GOBL ItemCode structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/item#/$defs/ItemCode'

      # @!attribute [r] label
      # Local or human reference for the type of code the value represents.
      # @return [String]
      attribute? :label, GOBL::Types::String.optional

      # @!attribute [r] value
      # The item code's value.
      # @return [String]
      attribute :value, GOBL::Types::String

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [ItemCode] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          label: data['label'],
          value: data['value']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'label' => attributes[:label],
          'value' => attributes[:value]
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {ItemCode} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [ItemCode] the object corresponding to the given input
    end
  end
end

