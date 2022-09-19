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
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/ExchangeRates'

      extend Forwardable
      include Enumerable

      attribute :_ary, GOBL::Types::Array.of(GOBL::Currency::ExchangeRate)

      def_delegators :_ary, :[], :each, :empty?, :length

      def self.from_gobl!(data)
        new(_ary: data&.map { |item| GOBL::Currency::ExchangeRate.from_gobl!(item) } )
      end

      def to_gobl
        _ary.map(&:to_gobl)
      end

      def self.new(object)
        case object
        when Array
          super _ary: object
        else
          super
        end
      end
    end
  end
end

