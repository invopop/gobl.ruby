# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # Advances contains an array of advance objects.
    class Advances < GOBL::Struct
      extend Forwardable
      include Enumerable

      attribute :_ary, GOBL::Types::Array.of(GOBL::Pay::Advance)

      def_delegators :_ary, :[], :each, :empty?, :length, :find

      def self.from_gobl!(data)
        new(_ary: data&.map { |item| GOBL::Pay::Advance.from_gobl!(item) } )
      end

      def to_gobl
        _ary
      end
    end
  end
end

