# frozen_string_literal: true

module Generators
  class Ruby
    # Base generator of a json schema of type array
    class Array < Struct
      def includes
        <<~EOFINC
          extend Forwardable
          include Enumerable
        EOFINC
      end

      def attributes
        <<~EOFATTR
          attribute :_ary, #{gobl_type_string(schema)}

          # @!method [](*args)
          #   Returns elements from the array
          #   @overload [](index)
          #     Returns the element in a specific position
          #     @param index [Integer] the position of the object
          #     @return [#{gobl_type_string(schema.items)}] the element in the `index` position
          #   @overload [](start, length)
          #     Returns all the elements within a range of positions
          #     @param start [Integer] start position of the range
          #     @param length [Integer] length of the range
          #     @return [Array<#{gobl_type_string(schema.items)}>] the elements in the range
          #   @overload [](range)
          #     Returns all the elements within a range
          #     @param range [Range] start and end positions of the range
          #     @return [Array<#{gobl_type_string(schema.items)}>] the elements in the range
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
        EOFATTR
      end

      def from_gobl_method
        <<~EOFMETH
          # Creates a new object from an array of GOBL data
          #
          # @param data [Array] an array of GOBL data
          #
          # @return [#{name}] the object created from the given data
          def self.from_gobl!(data)
            new(_ary: #{from_gobl_method_map_or_instance} )
          end
        EOFMETH
      end

      def from_gobl_method_map_or_instance
        klass = gobl_type_string(schema.items)
        if schema.items.ref.present?
          "data&.map { |item| #{klass}.from_gobl!(item) }"
        else
          'data'
        end
      end

      def to_gobl_method
        <<~EOFMETH
          # Returns an array of GOBL data representing the current object
          #
          # @return [Array<Hash>] the array of GOBL data that represents the current object
          def to_gobl
            _ary.map(&:to_gobl)
          end
        EOFMETH
      end

      def additional_methods
        klass = gobl_type_string(schema.items)
        <<~EOFADD
          # Returns a {#{name}} object from a given array of structs. The array may
          # contain {#{klass}} objects or hashes. If hashes are provided, the constructor
          # will call `#{klass}#new` to generate the objects that will be part of the
          # returned {#{name}} object
          #
          # @param object [Array<#{klass}, Hash>] the array containing the structs
          #
          # @return [#{name}] the object corresponding to the given input
          def self.new(object)
            case object
            when Array
              super _ary: object
            else # internal use, not to be used in public calls
              super
            end
          end
        EOFADD
      end
    end
  end
end
