# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # Outlays holds an array of Outlay objects used inside a billing document.
    class Outlays < GOBL::Struct
      extend Forwardable
      include Enumerable

      attribute :_ary, GOBL::Types::Array.of(Outlay)

      def_delegators :_ary, :[], :each, :empty?, :length, :find

      def self.from_gobl!(data)
        new(_ary: data&.map { |item| Outlay.from_gobl!(item) } )
      end

      def to_gobl
        _ary.map(&:to_gobl)
      end
    end
  end
end

