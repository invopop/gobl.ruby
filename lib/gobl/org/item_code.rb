# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # ItemCode contains a value and optional label property that means additional codes can be added to an item.
    class ItemCode < GOBL::Struct
      # Local or human reference for the type of code the value represents.
      attribute? :label, GOBL::Types::String.optional

      # The item code's value.
      attribute :value, GOBL::Types::String

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          label: data['label'],
          value: data['value']
        )
      end

      def to_gobl
        {
          'label' => attributes[:label],
          'value' => attributes[:value]
        }.compact
      end
    end
  end
end

