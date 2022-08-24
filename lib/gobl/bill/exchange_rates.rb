# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # ExchangeRates represents an array of currency exchange rates.
    class ExchangeRates < GOBL::Struct
      extend Forwardable
      include Enumerable

      attribute :_ary, GOBL::Types::Array.of(GOBL::Currency::ExchangeRate)

      def_delegators :_ary, :[], :each, :empty?, :length, :find

      def self.from_gobl!(data)
        new(_ary: data&.map { |item| GOBL::Currency::ExchangeRate.from_gobl!(item) } )
      end

      def to_gobl
        _ary
      end
    end
  end
end

