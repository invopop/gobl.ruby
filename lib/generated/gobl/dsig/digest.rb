# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.50.1
##

module GOBL
  module DSig
    # Digest defines a structure to hold a digest value including the algorithm used to generate it.
    class Digest < GOBL::Object
      # The Schema ID of the GOBL Digest structure
      SCHEMA_ID = 'https://gobl.org/draft-0/dsig/digest'

      # @!attribute [r] alg
      # Algorithm stores the algorithm key that was used to generate the value.
      # @return [String]
      property :alg, String
      validates_presence_of :alg

      # @!attribute [r] val
      # Value contains the Hexadecimal representation of the resulting hash generated by the algorithm.
      # @return [String]
      property :val, String
      validates_presence_of :val
    end
  end
end
