# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.23.0
##

require 'dry-struct'

module GOBL
  module UUID
    # Universally Unique Identifier. We only recommend using versions 1 and 4 within GoBL.
    class UUID < Dry::Struct
      attribute :value, GOBL::Types::String

      def self.from_gobl!(data)
        new(value: data)
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

