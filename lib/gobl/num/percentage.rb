# frozen_string_literal: true

module GOBL
  module Num
    Factor1 = Amount.new(value: 1)
    Factor100 = Amount.new(value: 100)

    # Similar to an Amount, but designed for percentages and includes % symbol in JSON output.
    class Percentage < Amount
      def to_s
        to_s_without_symbol + '%'
      end

      def to_s_without_symbol
        e = exp - 2
        e = 0 if e < 0
        p = multiply(Factor100).rescale(e)
        p.as_s
      end

      def of(a)
        a.multiply(self)
      end

      def from(a)
        x = a.divide(factor)
        a.subtract(x)
      end

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
