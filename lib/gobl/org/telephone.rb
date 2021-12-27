# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Org
    class Telephone < Dry::Struct
      attribute :uuid, GOBL::UUID::UUID.optional

      # Identifier for this number.
      attribute :label, GOBL::Types::String.optional

      # The number to be dialed in ITU E.164 international format.
      attribute :num, GOBL::Types::String

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          label: gobl['label'],
          num: gobl['num']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'label' => attributes[:label],
          'num' => attributes[:num]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
