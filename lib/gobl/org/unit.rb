# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.29.0
##

require 'dry-struct'

module GOBL
  module Org
    # Unit describes how the quantity of the product should be interpreted.
    class Unit < Dry::Struct
      attribute :_value, GOBL::Types::Any

      def self.from_gobl!(data)
        new(_value: data)
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        _value
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end

      def to_s
        _value.to_s
      end
    end
  end
end

