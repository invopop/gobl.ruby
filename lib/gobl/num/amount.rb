# frozen_string_literal: true

module GOBL
  module Num
    # Represents a numeric quantity with optional decimal places that determine accuracy
    class Amount < GOBL::Struct
      # The integer value of the amount
      attr_reader :value

      # The exponent, or number of significant figures of the amount
      attr_reader :exp

      # Creates a new {Amount} from the given data object
      #
      # @param data [Hash, String, #to_s, Amount] the data object. Supported types:
      #
      #   * A `Hash` with a `:value` key and, optionally, an `:exp` one,
      #   * A `String` or any other object that can be coerced into one via `#to_s`,
      #   * Another {Amount}
      def initialize(data)
        if data.is_a?(String)
          parse(data)
        elsif data.is_a?(Hash)
          @value = data[:value]
          @exp = data[:exp] || 0
        elsif data.is_a?(self.class)
          @value = data.value
          @exp = data.exp
        elsif data.respond_to?(:to_s)
          parse(data.to_s)
        else
          raise 'Unsupported input amount'
        end
      end

      # Returns the string representation of the current amount
      #
      # @return [String] the string representation of the current amount
      #
      # @see #as_s
      def to_s
        as_s
      end

      # Returns the string representation of the current amount
      #
      # @return [String] the string representation of the current amount
      def as_s
        return value.to_s if exp.zero?
        raise 'exponent too high' if exp > 100

        p = 10**exp
        v1, v2 = value.abs.divmod(p)
        sign = value.negative? ? '-' : ''
        format('%s%d.%0*d', sign, v1, exp, v2)
      end

      # Rescales each {Amount} in the pair ensuring both have the same exponent
      #
      # @param a1 [Amount] the first amount of the pair
      # @param a2 [Amount] the second amount of the pair
      #
      # @return [Array(Amount, Amount)] the rescaled pair of amounts
      def self.rescale_pair(a1, a2)
        exp = a1.exp
        exp = a2.exp if a2.exp > exp
        [a1.rescale(exp), a2.rescale(exp)]
      end

      # Compares the current amount with another one
      #
      # @param other [Amount] the {Amount} to compare with
      #
      # @return [Integer] the result of the comparison:
      #
      #   * `-1` if the current amount is lesser than the given one
      #   * `1` if current amount is greater than the given one
      #   * `0` if both amounts are equal
      def compare(other)
        a1, a2 = self.class.rescale_pair(self, other)
        if a1.value < a2.value
          -1
        elsif a1.value > a2.value
          1
        else
          0 # same
        end
      end

      # Returns whether the current amount is equal to another one
      #
      # @param other [Amount] the {Amount} to compare with
      #
      # @return [Boolean] whether the two amounts are equal (`true`) or not (`false`)
      def ==(other)
        compare(other).zero?
      end

      # Changes the exponent of the {Amount} multipling or dividing its value as
      # necessary. A lower exponent implies loosing accuracy.
      #
      # @param e [Integer] the new exponent
      #
      # @return [Amount] the rescaled {Amount}
      def rescale(e)
        if exp > e
          # divide
          x = exp - e
          v = (value.to_f / (10**x)).round
          self.class.new(value: v, exp: e)
        elsif exp < e
          # multiply
          x = e - exp
          v = value * (10**x)
          self.class.new(value: v, exp: e)
        else
          # nothing
          self
        end
      end

      # Returns whether the current amount is equal to zero
      #
      # @return [Boolean] `true` if the current amount is equal to zero, `false`otherwise
      def zero?
        value.zero?
      end

      # Adds the current amount to a given one
      #
      # @param a2 [Amount] the amount to add
      #
      # @return [Amount] the amount resulted from the operation
      def add(a2)
        a2 = a2.rescale(exp)
        self.class.new(value: value + a2.value, exp: exp)
      end

      # Subtracts a given {Amount} from the current one
      #
      # @param a2 [Amount] the amount to subtract
      #
      # @return [Amount] the amount resulted from the operation
      def subtract(a2)
        a2 = a2.rescale(exp)
        self.class.new(value: value - a2.value, exp: exp)
      end

      # Multiplies a given {Amount} with the current one
      #
      # @param a2 [Amount] the amount to multiply with
      #
      # @return [Amount] the amount resulted from the operation
      def multiply(a2)
        v = (value * a2.value) / (10**a2.exp)
        self.class.new(value: v, exp: exp)
      end

      # Divides the current amount by the given one
      #
      # @param a2 [Amount] the amount to divide by
      #
      # @return [Amount] the amount resulted from the operation
      def divide(a2)
        v = (value.to_f * (10**a2.exp)) / a2.value.to_f
        self.class.new(value: v.round, exp: exp)
      end

      # Splits the current amount into equal `x` parts providing a second amount with
      # the remainder. This is like {#divide}, but will correctly account for rounding
      # errors.
      #
      # @param x [Integer] the number of parts to divide the amount into
      #
      # @return [Array(Amount, Amount)] the split amount and the remider amount
      def split(x)
        a2 = divide(self.class.new(value: x, exp: 0))
        a3 = a2.multiply(self.class.new(value: x - 1, exp: 0))
        a3 = subtract(a3)
        [a2, a3]
      end

      # Inverts the sign of the current amount
      #
      # @return [Amount] the amount with the opposite sign
      def invert
        self.class.new(value: -value, exp: exp)
      end

      #  @api private
      def as_json(*)
        to_s
      end

      protected

      # Extract the value and exponent from the string.
      # Implementation copied from base GOBL library.
      def parse(str)
        x = str.split('.')
        raise "invalid amount '#{str}'" if x.length > 2 # abort

        v = x[0].to_i
        e = 0

        if x[1]
          v2 = x[1].to_i
          e = x[1].length
          v *= 10**e
          v += x[0].match?(/^-/) ? -v2 : v2
        end

        @value = v
        @exp = e
      end
    end
  end
end
