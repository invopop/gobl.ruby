# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.24.0
##

require 'dry-struct'

module GOBL
  module Bill
    # SchemeKeys stores a list of keys that makes it easier to perform matches.
    class SchemeKeys < Dry::Struct
      extend Forwardable
      include Enumerable

      attribute :_ary, GOBL::Types::Array.of(GOBL::Types::String)

      def_delegators :_ary, :[], :each, :empty?, :length, :find

      def self.from_gobl!(data)
        new(_ary: data )
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
    end
  end
end

