# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##


module GOBL
  # Stamp defines an official seal of approval from a third party like a governmental agency or intermediary and should thus be included in any official envelopes.
  class Stamp < GOBL::Struct
    # The Schema ID of the GOBL Stamp structure
    SCHEMA_ID = 'https://gobl.org/draft-0/envelope#/$defs/Stamp'

    # @!attribute [r] prv
    # Identity of the agency used to create the stamp usually defined by each region.
    # @return [GOBL::Org::Key]
    attribute :prv, GOBL::Org::Key

    # @!attribute [r] val
    # The serialized stamp value generated for or by the external agency
    # @return [String]
    attribute :val, GOBL::Types::String

    # Creates a new object from a hash of GOBL data
    #
    # @param data [Hash] a hash of GOBL data
    #
    # @return [Stamp] the object created from the given data
    def self.from_gobl!(data)
      data = GOBL::Types::Hash[data]

      new(
        prv: GOBL::Org::Key.from_gobl!(data['prv']),
        val: data['val']
      )
    end

    # Returns a hash of GOBL data representing the current object
    #
    # @return [Hash] the array of GOBL data that represents the current object
    def to_gobl
      {
        'prv' => attributes[:prv]&.to_gobl,
        'val' => attributes[:val]
      }.compact
    end

    # @!method self.new(attrs)
    #
    #   Returns a {Stamp} object from a given hash of attributes. Nested
    #   attributes are supported: the constructor will instantiate the proper GOBL
    #   objects when nested hashes or arrays are given as part of the `attrs`
    #   parameter.
    #
    #   @param attrs [Hash] the hash of attributes
    #
    #   @return [Stamp] the object corresponding to the given input
  end
end

