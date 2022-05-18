# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Tax
    # Schemes defines an array of scheme objects with helper functions.
    class Schemes < Dry::Struct
      extend Forwardable
      include Enumerable

      attribute :ary, GOBL::Types::Array.of(Scheme)

      def_delegators :ary, :[], :each, :empty?, :length, :find

      def self.from_gobl!(data)
        new(ary: data&.map { |item| Scheme.from_gobl!(item) } )
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

