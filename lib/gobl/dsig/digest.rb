# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.3
##


module GOBL
  module DSig
    # Digest defines a structure to hold a digest value including the algorithm used to generate it.
    class Digest < GOBL::Struct
      # The Schema ID of the GOBL Digest structure
      SCHEMA_ID = 'https://gobl.org/draft-0/dsig/digest'

      # @!attribute [r] alg
      # Algorithm stores the algorithm key that was used to generate the value.
      # @return [String]
      attribute :alg, GOBL::Types::String

      # @!attribute [r] val
      # Value contains the Hexadecimal representation of the resulting hash generated by the algorithm.
      # @return [String]
      attribute :val, GOBL::Types::String

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Digest] the object created from the given data
      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          alg: data['alg'],
          val: data['val']
        )
      end

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
      def to_gobl
        {
          'alg' => attributes[:alg],
          'val' => attributes[:val]
        }.compact
      end

      # @!method self.new(attrs)
      #
      #   Returns a {Digest} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Digest] the object corresponding to the given input
    end
  end
end

