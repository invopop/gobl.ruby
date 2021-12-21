# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class RateTotal < Model::Struct
      attribute :code, Model::Types::String

      attribute :base, Model::Types::String

      attribute :percent, Model::Types::String

      attribute :value, Model::Types::String

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          code: gobl['code'],
          base: gobl['base'],
          percent: gobl['percent'],
          value: gobl['value']
        )
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'base' => attributes[:base],
          'percent' => attributes[:percent],
          'value' => attributes[:value]
        }
      end
    end
  end
end
