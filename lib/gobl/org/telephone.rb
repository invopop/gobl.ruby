# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.23.0
##

require 'dry-struct'

module GOBL
  module Org
    # Telephone describes what is expected for a telephone number.
    class Telephone < Dry::Struct
      attribute :uuid, GOBL::UUID::UUID.optional

      # Identifier for this number.
      attribute :label, GOBL::Types::String.optional

      # The number to be dialed in ITU E.164 international format.
      attribute :num, GOBL::Types::String

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          label: data['label'],
          num: data['num']
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

