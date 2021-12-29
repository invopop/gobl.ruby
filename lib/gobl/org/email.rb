# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Org
    class Email < Dry::Struct
      attribute :uuid, GOBL::UUID::UUID.optional

      # Identifier for the email.
      attribute :label, GOBL::Types::String.optional

      # Electronic mailing address.
      attribute :addr, GOBL::Types::String

      # Additional fields.
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          label: gobl['label'],
          addr: gobl['addr'],
          meta: gobl['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'label' => attributes[:label],
          'addr' => attributes[:addr],
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
