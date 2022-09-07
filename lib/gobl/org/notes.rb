# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Notes holds an array of Note objects
    class Notes < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/org/notes'

      extend Forwardable
      include Enumerable

      attribute :_ary, GOBL::Types::Array.of(Note)

      def_delegators :_ary, :[], :each, :empty?, :length, :find

      def self.from_gobl!(data)
        new(_ary: data&.map { |item| Note.from_gobl!(item) } )
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

