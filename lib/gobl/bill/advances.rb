# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##

module GOBL
  module Bill
    # Advances contains an array of advance objects.
    class Advances < GOBL::Struct
      extend Forwardable
      include Enumerable

      # The Schema ID of the GOBL Advances structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Advances'

      attribute :_ary, GOBL::Types::Array.of(GOBL::Pay::Advance)

      # @!method [](*args)
      #   Returns elements from the array
      #   @overload [](index)
      #     Returns the element in a specific position
      #     @param index [Integer] the position of the object
      #     @return [GOBL::Pay::Advance] the element in the `index` position
      #   @overload [](start, length)
      #     Returns all the elements within a range of positions
      #     @param start [Integer] start position of the range
      #     @param length [Integer] length of the range
      #     @return [Array<GOBL::Pay::Advance>] the elements in the range
      #   @overload [](range)
      #     Returns all the elements within a range
      #     @param range [Range] start and end positions of the range
      #     @return [Array<GOBL::Pay::Advance>] the elements in the range
      #
      # @!method each
      #   Iterates over the array elements
      #   @overload each(&block)
      #     Calls the given block with each element in the array
      #     @yield [element] element of the array
      #     @return [self] the object itself
      #   @overload each
      #     Returns an Enumerator that iterates over the array elements
      #     @return [Enumerator] the enumerator of the array elements
      #
      # @!method empty?
      #   Returns `true` if the number of elements in the array is zero, `false` otherwise.
      #   @return [Boolean] whether the array is empty or not
      #
      # @!method length
      #   Returns the number of elements in the array
      #   @return [Integer] the number of elements in the array
      def_delegators :_ary, :[], :each, :empty?, :length

      # Creates a new object from an array of GOBL data
      #
      # @param data [Array] an array of GOBL data
      #
      # @return [Advances] the object created from the given data
      def self.from_gobl!(data)
        new(_ary: data&.map { |item| GOBL::Pay::Advance.from_gobl!(item) })
      end

      # Returns an array of GOBL data representing the current object
      #
      # @return [Array<Hash>] the array of GOBL data that represents the current object
      def to_gobl
        _ary.map(&:to_gobl)
      end

      # Returns a {Advances} object from a given array of structs. The array may
      # contain {GOBL::Pay::Advance} objects or hashes. If hashes are provided, the constructor
      # will call `GOBL::Pay::Advance#new` to generate the objects that will be part of the
      # returned {Advances} object
      #
      # @param object [Array<GOBL::Pay::Advance, Hash>] the array containing the structs
      #
      # @return [Advances] the object corresponding to the given input
      def self.new(object)
        case object
        when Array
          super _ary: object
        else # internal use, not to be used in public calls
          super
        end
      end
    end
  end
end
