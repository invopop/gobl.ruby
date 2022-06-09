# frozen_string_literal: true

module GOBLExtensions
  module Num
    module AmountHelper
      extend ActiveSupport::Concern

      included do
        attr_accessor :value
        attr_accessor :exp
      end

      class_methods do

        def new_from(value, exp)
          s = stringify(value, exp)
          new(_value: s)
        end

        def stringify(value, exp)
          return value.to_s if exp == 0
          raise 'exponent too high' if exp > 100

          p = 10**exp
          v1 = value / p
          v2 = value - (v1 * p)
          v2 = -v2 if v2 < 0
          format('%d.%0*d', v1, exp, v2)
        end

        # rescale_pair ensures both values have a matching exponential
        def rescale_pair(a1, a2)
          exp = a1.exp
          exp = a2.exp if a2.exp > exp
          [a1.rescale(exp), a2.rescale(exp)]
        end

      end

      def initialize(data)
        super(data)
        parse unless _value.empty?
      end

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

      def ==(other)
        compare(other) == 0
      end

      # Multiply or divide the amount's value to match the provided
      # expontential. A lower exponential implies loosing accuracy.
      def rescale(e)
        if @exp > e
          # divide
          x = exp - e
          v = (value.to_f / (10**x)).round
          self.class.new_from(v, e)
        elsif @exp < e
          # multiply
          x = e - exp
          v = value * (10**x)
          self.class.new_from(v, e)
        else
          # nothing
          self
        end
      end

      private

      # Extract the value and exponent from the string.
      # Implementation copied from base GOBL library.
      def parse
        x = _value.split('.')
        raise "invalid amount '#{_value}'" if x.length > 2 # abort

        v = x[0].to_i
        e = 0

        if x[1]
          v2 = x[1].to_i
          e = x[1].length
          v *= 10**e
          v += v2
        end

        @value = v
        @exp = e
      end

    end
  end
end
