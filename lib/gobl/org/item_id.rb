# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class ItemID < Model::Struct
      attribute :value, Model::Types::String

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          value: gobl['value']
        )
      end

      def to_gobl
        {
          'value' => attributes[:value]
        }
      end
    end
  end
end
