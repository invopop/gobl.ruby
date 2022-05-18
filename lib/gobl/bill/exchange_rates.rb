# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    # ExchangeRates represents an array of currency exchange rates.
    class ExchangeRates < Dry::Struct
      extend Forwardable
      include Enumerable

      attribute :ary, GOBL::Types::Array.of(GOBL::Currency::ExchangeRate)

      def_delegators :ary, :[], :each, :empty?, :length, :find

      def self.from_gobl!(data)
        new(ary: data&.map { |item| GOBL::Currency::ExchangeRate.from_gobl!(item) } )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        ary
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

