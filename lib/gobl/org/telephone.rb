# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class Telephone < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional

      # Identifier for this number.
      attribute :label, Model::Types::String.optional

      # The number to be dialed in ITU E.164 international format.
      attribute :num, Model::Types::String

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          label: gobl['label'],
          num: gobl['num']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'label' => attributes[:label],
          'num' => attributes[:num]
        }
      end
    end
  end
end
