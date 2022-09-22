# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##


module GOBL
  module Org
    # Short upper-case identifier.
    class Code < GOBL::Struct
      # The Schema ID of the GOBL Code structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/code'

      attribute :_value, GOBL::Types::String
      private :_value

      # Creates a new object from a GOBL value
      #
      # @param data [String] the GOBL value
      #
      # @return [Code] the object created from the given data
      def self.from_gobl!(data)
        new(_value: data)
      end

      # Returns a GOBL value representing the current object
      #
      # @return [String] the GOBL value that represents the current object
      def to_gobl
        _value
      end

      # Returns a {Code} that corresponds to a given object. The object can be a
      # `Symbol`, a `String` or anything coercible into one (via `#to_s`).
      #
      # @param object [Symbol, String, #to_s] the value of the object.
      #
      # @return [Code] the object corresponding to the given value.
      #
      # @example Instantiating from a symbol
      #   code = GOBL::Org::Code.new(:value)
      #
      # @example Instantiating from a string
      #   code = GOBL::Org::Code.new('value')
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
      # to {Code} objects, the current object can be compared to a `Symbol`, a
      # `String` or anything coercible into one (via `#to_s`)
      #
      # @param other [Code, Symbol, String, #to_s] the other object to compare to
      #
      # @return [Boolean] `true` if the objects are equivalent, `false` otherwise
      #
      # @example Comparing to another {Code} object
      #   code = GOBL::Org::Code.new('value')
      #   code == GOBL::Org::Code.new('value') #=> true
      #   code == GOBL::Org::Code.new('other') #=> false
      #
      # @example Comparing to a string
      #   code = GOBL::Org::Code.new('value')
      #   code == 'value' #=> true
      #   code == 'other' #=> false
      #
      # @example Comparing to a symbol
      #   code = GOBL::Org::Code.new('value')
      #   code == :value #=> true
      #   code == :other #=> false
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

