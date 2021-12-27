# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Pay
    class Online < Dry::Struct
      # Descriptive name given to the online provider.
      attribute :name, GOBL::Types::String.optional

      # Full URL to be used for payment.
      attribute :addr, GOBL::Types::String

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          name: gobl['name'],
          addr: gobl['addr']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'name' => attributes[:name],
          'addr' => attributes[:addr]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
