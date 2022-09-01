# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # Lines holds an array of Line objects.
    class Lines < GOBL::Struct
      extend Forwardable
      include Enumerable

      attribute :_ary, GOBL::Types::Array.of(Line)

      def_delegators :_ary, :[], :each, :empty?, :length, :find

      def self.from_gobl!(data)
        new(_ary: data&.map { |item| Line.from_gobl!(item) } )
      end

      def to_gobl
        _ary.map(&:to_gobl)
      end
    end
  end
end

