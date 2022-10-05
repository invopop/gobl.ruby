# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##

module GOBL
  # Contents of the envelope that must contain a $schema.
  class Document < GOBL::Struct
    extend Forwardable
    include Enumerable

    # The Schema ID of the GOBL Document structure
    SCHEMA_ID = 'https://gobl.org/draft-0/envelope#/$defs/Document'

    attribute :_value, GOBL::Types::Hash

    # @!method [](key)
    #   Returns the value associated with the given key
    #   @param key [Object] the key
    #   @return [Object] the value associated with the given key
    #
    # @!method each
    #   Iterates over each key-value pair in the map
    #   @overload each(&block)
    #     Calls the given block with each key-value pair in the map
    #     @yield [key, value] a key-value pair of the map
    #     @return [self] the object itself
    #   @overload each
    #     Returns an Enumerator that iterates over the key-value pairs in the map
    #     @return [Enumerator] the enumerator of the key-value pairs
    #
    # @!method empty?
    #   Returns `true` if the number of entires in the map is zero, `false` otherwise.
    #   @return [Boolean] whether the map is empty or not
    #
    # @!method length
    #   Returns the number of entries in the map
    #   @return [Integer] the number of entries in the map
    #
    # @!method each_key
    #   Iterates over each key in the map
    #   @overload each(&block)
    #     Calls the given block with each key in the map
    #     @yield [key] a key of the map
    #     @return [self] the object itself
    #   @overload each
    #     Returns an Enumerator that iterates over the keys in the map
    #     @return [Enumerator] the enumerator of the keys
    def_delegators :_value, :[], :each, :empty?, :length, :each_key

    # Creates a new object from a hash of GOBL data
    #
    # @param data [Hash] a hash of GOBL data
    #
    # @return [Document] the object created from the given data
    def self.from_gobl!(data)
      new(_value: data)
    end

    # Returns a hash of GOBL data representing the current object
    #
    # @return [Hash] the hash of GOBL data that represents the current object
    def to_gobl
      _value
    end
  end
end
