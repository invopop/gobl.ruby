# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Pay
    # Online provides the details required to make a payment online using a website
    class Online < GOBL::Struct
      # The Schema ID of the GOBL Online structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/Online'

      # @!attribute [r] name
      # Descriptive name given to the online provider.
      # @return [String]
      attribute? :name, GOBL::Types::String.optional

      # @!attribute [r] addr
      # Full URL to be used for payment.
      # @return [String]
      attribute :addr, GOBL::Types::String

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Online] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          name: data['name'],
          addr: data['addr']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'name' => attributes[:name],
          'addr' => attributes[:addr]
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Online} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Online] the object corresponding to the given input
    end
  end
end

