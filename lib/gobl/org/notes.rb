# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.28.1
##

require 'dry-struct'

module GOBL
  module Org
    # Notes holds an array of Note objects
    class Notes < Dry::Struct
      extend Forwardable
      include Enumerable

      attribute :_ary, GOBL::Types::Array.of(Note)

      def_delegators :_ary, :[], :each, :empty?, :length, :find

      def self.from_gobl!(data)
        new(_ary: data&.map { |item| Note.from_gobl!(item) } )
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
