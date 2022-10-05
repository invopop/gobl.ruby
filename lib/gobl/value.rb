# frozen_string_literal: true

module GOBL
  # Base class for single value structs in the GOBL Schema
  class Value < Struct
    # Initializes a new value object that corresponds to a given value. The value can be a
    # `Symbol`, a `String` or anything coercible into one (via `#to_s`).
    #
    # @param value [Symbol, String, #to_s] the value of the object.
    #
    # @return [Value] the value object corresponding to the given value.
    def initialize(value)
      super()
      self._value = value.to_s
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

    # Returns whether the current value is equal to a given one. In addition to
    # objects of the same type, the current object can be compared to a `Symbol`, a
    # `String` or anything coercible into one (via `#to_s`)
    #
    # @param other [Value, Symbol, String, #to_s] the other value to compare with
    #
    # @return [Boolean] `true` if the values are equal, `false` otherwise
    def ==(other)
      case other
      when self.class
        _value == other._value
      when Symbol
        to_sym == other
      else
        to_s == other.to_s
      end
    end

    # @api private
    def as_json(**args)
      _value.as_json(**args)
    end

    protected

    attr_accessor :_value
  end
end
