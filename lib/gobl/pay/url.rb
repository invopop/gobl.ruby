# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Pay
    class URL < Dry::Struct
      attribute :uuid, GOBL::UUID::UUID.optional

      # Full URL to be used for payment.
      attribute :addr, GOBL::Types::String

      # Additional details which may be useful to the end-user.
      attribute :notes, GOBL::Types::String.optional

      # Semi-structured additional data.
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          addr: gobl['addr'],
          notes: gobl['notes'],
          meta: gobl['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'addr' => attributes[:addr],
          'notes' => attributes[:notes],
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
