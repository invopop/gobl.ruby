# frozen_string_literal: true

module GOBL
  module Num
    Factor1 = Amount.new(value: 1) # @api private
    Factor100 = Amount.new(value: 100) # @api private

    # Similar to {GOBL::Num::Amount}, but specialized in representing percentages
    class Percentage < Amount
      # Returns a string representation of the percentage with the percentage symbol
      #
      # @return [String] the string representing the percentage
      def to_s
        to_s_without_symbol + '%'
      end

      # Returns a string representation of the percentage with_out the percentage symbol
      #
      # @return [String] the string representing the percentage
      def to_s_without_symbol
        e = exp - 2
        e = 0 if e < 0
        p = multiply(Factor100).rescale(e)
        p.as_s
      end

      # Calculates the "percent of" a given amount
      #
      # @param a [GOBL::Num::Amount] the amount to calculate the percent of
      #
      # @return [GOBL::Num::Amount] the calculated amount
      def of(a)
        a.multiply(self)
      end

      # Calculates what "percent from" the given amount would result assuming the rate has
      # already been applied. Put otherwise, for a given amount that was increased by the
      # current percentage, this method returns the amount of that increment.
      #
      # @example
      #   original_amount = GOBL::Num::Amount.new("200")
      #   percentage = GOBL::Num::Percentage.new("25%")
      #   increment = percentage.of(original_amount) #=> 50
      #
      #   increased_amount = original_amount.add(increment) #=> 250
      #   percentage.from(increased_amount) #=> 50
      #
      # @param a [GOBL::Num::Amount] the amount to calculate the percent from
      #
      # @return [GOBL::Num::Amount] the calculated amount
      def from(a)
        x = a.divide(factor)
        a.subtract(x)
      end

      # Returns the percentage amount as a factor, adding 1 to the rate
      #
      # @return [GOBL::Num::Amount] the factor
      def factor
        Amount.new(value: value, exp: exp).add(Factor1)
      end

      protected

      def parse(data)
        return if data.length.zero?

        rescale = false
        if data[-1] == '%'
          data = data.chomp('%')
          rescale = true
        end

        super(data)

        if rescale
          p = self.rescale(exp + 2).divide(Factor100)
          @value = p.value
          @exp = p.exp
        end
      end
    end
  end
end
