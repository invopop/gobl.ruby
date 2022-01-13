# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Num
    class Amount < Dry::Struct
      # Quantity with optional decimal places that determine accuracy.
      attribute :value, GOBL::Types::String.optional

      def self.from_gobl!(gobl)
        new(
          value: gobl
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        value
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end

      def to_s
        value.to_s
      end
    end
  end
end
