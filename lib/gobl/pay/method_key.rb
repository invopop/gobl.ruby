# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.4
##

module GOBL
  module Pay
    # Method Key describes how a payment should be made
    class MethodKey < GOBL::Struct
      # The Schema ID of the GOBL MethodKey structure
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/instructions#/$defs/MethodKey'

      # The enumeration of values of the object and their descriptions (Values different to these are not allowed)
      ENUM = {
        'any' => 'Any method available, no preference',
        'card' => 'Credit or debit card',
        'credit-transfer' => 'Send initiated bank or wire transfer',
        'debit-transfer' => 'Receive initiated bank or wire transfer',
        'cash' => 'Cash',
        'direct-debit' => 'Direct debit',
        'online' => 'Online or web payment'
      }.freeze

      attribute :_value, GOBL::Types::String.enum(*ENUM.keys)
      private :_value

      # Creates a new object from a GOBL value
      #
      # @param data [String] the GOBL value
      #
      # @return [MethodKey] the object created from the given data
      def self.from_gobl!(data)
        new(_value: data)
      end

      # Returns a GOBL value representing the current object
      #
      # @return [String] the GOBL value that represents the current object
      def to_gobl
        _value
      end

      # Returns a {MethodKey} that corresponds to a given object. The object can be a
      # `Symbol`, a `String` or anything coercible into one (via `#to_s`).
      #
      # @param object [Symbol, String, #to_s] the value of the object.
      #
      # @return [MethodKey] the object corresponding to the given value.
      #
      # @example Instantiating from a symbol
      #   method_key = GOBL::Pay::MethodKey.new(:any)
      #
      # @example Instantiating from a string
      #   method_key = GOBL::Pay::MethodKey.new('any')
      def self.new(object)
        case object
        when Hash, self # internal use, not to be used in public calls
          super
        when Symbol
          new find_by_sym(object)
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
      # to {MethodKey} objects, the current object can be compared to a `Symbol`, a
      # `String` or anything coercible into one (via `#to_s`)
      #
      # @param other [MethodKey, Symbol, String, #to_s] the other object to compare to
      #
      # @return [Boolean] `true` if the objects are equivalent, `false` otherwise
      #
      # @example Comparing to another {MethodKey} object
      #   method_key = GOBL::Pay::MethodKey.new('any')
      #   method_key == GOBL::Pay::MethodKey.new('any') #=> true
      #   method_key == GOBL::Pay::MethodKey.new('card') #=> false
      #
      # @example Comparing to a string
      #   method_key = GOBL::Pay::MethodKey.new('any')
      #   method_key == 'any' #=> true
      #   method_key == 'card' #=> false
      #
      # @example Comparing to a symbol
      #   method_key = GOBL::Pay::MethodKey.new('any')
      #   method_key == :any #=> true
      #   method_key == :card #=> false
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

      # Returns an array with all the enumerated objects of this type
      #
      # @return [Array<MethodKey>] the array of enumerated objects
      def self.all
        ENUM.keys.map { |key| new(key) }
      end

      # @api private
      def self.find_by_sym(sym)
        all.find { |object| object.to_sym == sym }
      end

      # @api private
      def self.find_by_inquirer(method_name)
        method_name =~ /(.+)\?$/ && find_by_sym(Regexp.last_match(1).to_sym)
      end

      # Returns the description of the current object
      #
      # @return [String] the description of the current object
      def description
        ENUM.fetch(_value, _value)
      end

      # @api private
      def respond_to_missing?(method_name, include_private = false)
        self.class.find_by_inquirer(method_name) || super
      end

      # Enables dynamic value inquirers like `MethodKey#any?` for
      # each of the declared enum values (see {ENUM}). Each inquirer returns a
      # `Boolean` denoting whether the value equals the enquired value (`true`) or
      # not (`false`)
      #
      # @example
      #   method_key = GOBL::Pay::MethodKey.new('any')
      #   method_key.any? # => true
      #   method_key.card? # => false
      def method_missing(method_name, *args, &block)
        if value = self.class.find_by_inquirer(method_name)
          self == value
        else
          super
        end
      end
    end
  end
end
