# frozen_string_literal: true

module GOBL
  # Base class for map structures in the GOBL Schema. A map is an unconstrained list of
  # keys and values
  class Map < Struct
    extend Forwardable
    include Enumerable

    # @api private
    attr_accessor :_map

    # Initializes a new map struct that corresponds to a given Hash
    #
    # @param map [Hash] the hash with the map data
    #
    # @return [Map] a new map object
    def initialize(map)
      super()
      self._map = map
    end

    # @api private
    def as_json(...)
      _map.as_json(...)
    end

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
    def_delegators :_map, :[], :each, :empty?, :length, :each_key
  end
end
