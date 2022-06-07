# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.23.0
##

require 'dry-struct'

module GOBL
  module Bill
    # Advances contains an array of advance objects.
    class Advances < Dry::Struct
      extend Forwardable
      include Enumerable

      attribute :ary, GOBL::Types::Array.of(GOBL::Pay::Advance)

      def_delegators :ary, :[], :each, :empty?, :length, :find

      def self.from_gobl!(data)
        new(ary: data&.map { |item| GOBL::Pay::Advance.from_gobl!(item) } )
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

