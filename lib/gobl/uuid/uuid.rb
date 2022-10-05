# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##

module GOBL
  module UUID
    # Universally Unique Identifier. We only recommend using versions 1 and 4 within GOBL.
    class UUID < GOBL::Struct
      # The Schema ID of the GOBL UUID structure
      SCHEMA_ID = 'https://gobl.org/draft-0/uuid/uuid'

      attribute :_value, GOBL::Types::String
      private :_value

      # Creates a new object from a GOBL value
      #
      # @param data [String] the GOBL value
      #
      # @return [UUID] the object created from the given data
      def self.from_gobl!(data)
        new(_value: data)
      end

      # Returns a GOBL value representing the current object
      #
      # @return [String] the GOBL value that represents the current object
      def to_gobl
        _value
      end

      # Returns a {UUID} that corresponds to a given object. The object can be a
      # `Symbol`, a `String` or anything coercible into one (via `#to_s`).
      #
      # @param object [Symbol, String, #to_s] the value of the object.
      #
      # @return [UUID] the object corresponding to the given value.
      #
      # @example Instantiating from a symbol
      #   uuid = GOBL::UUID::UUID.new(:value)
      #
      # @example Instantiating from a string
      #   uuid = GOBL::UUID::UUID.new('value')
      def self.new(object)
        case object
        when Hash, self # internal use, not to be used in public calls
          super
        when Symbol
          new object.to_s
        else
          super _value: object.to_s
        end
      end

      # Returns the string representation of the current object
      #
      # @return [String] the string representation of the current object
      def to_s
        _value.to_s
      end

      # Returns the symbol representation of the current object
      #
      # @return [Symbol] the symbol representation of the current object
      def to_sym
        to_s.parameterize.underscore.to_sym
      end

      # Returns whether the current object is equivalent to a given one. In addition
      # to {UUID} objects, the current object can be compared to a `Symbol`, a
      # `String` or anything coercible into one (via `#to_s`)
      #
      # @param other [UUID, Symbol, String, #to_s] the other object to compare to
      #
      # @return [Boolean] `true` if the objects are equivalent, `false` otherwise
      #
      # @example Comparing to another {UUID} object
      #   uuid = GOBL::UUID::UUID.new('value')
      #   uuid == GOBL::UUID::UUID.new('value') #=> true
      #   uuid == GOBL::UUID::UUID.new('other') #=> false
      #
      # @example Comparing to a string
      #   uuid = GOBL::UUID::UUID.new('value')
      #   uuid == 'value' #=> true
      #   uuid == 'other' #=> false
      #
      # @example Comparing to a symbol
      #   uuid = GOBL::UUID::UUID.new('value')
      #   uuid == :value #=> true
      #   uuid == :other #=> false
      def ==(other)
        case other
        when self.class
          super
        when Symbol
          to_sym == other
        else
          to_s == other.to_s
        end
      end
    end
  end
end
