# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Tax
    # Localities stores an array of locality objects used to describe areas sub-divisions inside a region.
    class Localities < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/region#/$defs/Localities'

      extend Forwardable
      include Enumerable

      attribute :_ary, GOBL::Types::Array.of(Locality)

      def_delegators :_ary, :[], :each, :empty?, :length

      def self.from_gobl!(data)
        new(_ary: data&.map { |item| Locality.from_gobl!(item) } )
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

