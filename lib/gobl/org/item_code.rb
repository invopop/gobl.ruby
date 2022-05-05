# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Org
    class ItemCode < Dry::Struct
      # Local or human reference for the type of code the value represents.
      attribute :label, GOBL::Types::String.optional

      # The item code's value.
      attribute :value, GOBL::Types::String

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          label: data['label'],
          value: data['value']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'label' => attributes[:label],
          'value' => attributes[:value]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
