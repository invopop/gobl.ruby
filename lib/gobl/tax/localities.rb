# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

require 'dry-struct'

module GOBL
  module Tax
    # Localities stores an array of locality objects used to describe areas sub-divisions inside a region.
    class Localities < Dry::Struct
      extend Forwardable
      include Enumerable

      attribute :_ary, GOBL::Types::Array.of(Locality)

      def_delegators :_ary, :[], :each, :empty?, :length, :find

      def self.from_gobl!(data)
        new(_ary: data&.map { |item| Locality.from_gobl!(item) } )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        _ary
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
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

