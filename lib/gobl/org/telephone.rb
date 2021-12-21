# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class Telephone < Model::Struct
      attribute :uuid, Model::Types::String.optional

      # Identifier for this number.
      attribute :label, Model::Types::String.optional

      # The number to be dialed in ITU E.164 international format.
      attribute :num, Model::Types::String

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          label: gobl['label'],
          num: gobl['num']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
          'label' => attributes[:label],
          'num' => attributes[:num]
        }
      end
    end
  end
end
