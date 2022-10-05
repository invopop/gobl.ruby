# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##

module GOBL
  module Bill
    # Ordering allows additional order details to be appended
    class Ordering < GOBL::Struct
      # The Schema ID of the GOBL Ordering structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Ordering'

      # @!attribute [r] seller
      # Party who is selling the goods and is not responsible for taxes
      # @return [GOBL::Org::Party]
      attribute? :seller, GOBL::Org::Party.optional

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Ordering] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          seller: data['seller'] ? GOBL::Org::Party.from_gobl!(data['seller']) : nil
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'seller' => attributes[:seller]&.to_gobl
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Ordering} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   The `new` method will only allow to create a new object if all attributes
      #   marked as mandatory and not calculated in the JSON schema are provided.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Ordering] the object corresponding to the given input
    end
  end
end
