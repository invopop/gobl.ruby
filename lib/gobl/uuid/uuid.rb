# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'forwardable'

require 'dry-struct'

module GOBL
  module UUID
    class UUID < Dry::Struct
      extend Forwardable

      def_delegators :value, :to_s

      # Universally Unique Identifier. We only recommend using versions 1 and 4 within GoBL.
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
    end
  end
end
