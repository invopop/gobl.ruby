# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class Value < Model::Struct
      # Date from which this value should be applied.
      attribute :since, Model::Types::String.optional

      # Rate that should be applied.
      attribute :percent, Model::Types::String

      # When true
      attribute :disabled, Model::Types::Bool.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          since: gobl['since'],
          percent: gobl['percent'],
          disabled: gobl['disabled']
        )
      end

      def to_gobl
        {
          'since' => attributes[:since],
          'percent' => attributes[:percent],
          'disabled' => attributes[:disabled]
        }
      end
    end
  end
end
