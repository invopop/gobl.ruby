# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Tax
    # Set defines a list of tax categories and their rates to be used alongside taxable items.
    class Set < Dry::Struct
      extend Forwardable
      include Enumerable

      attribute :ary, GOBL::Types::Array.of(Combo)

      def_delegators :ary, :[], :each, :empty?

      def self.from_gobl!(data)
        new(ary: data&.map { |item| Combo.from_gobl!(item) } )
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

