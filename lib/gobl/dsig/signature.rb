# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module DSig
    # JSON Web Signature in compact form.
    class Signature < Dry::Struct
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

