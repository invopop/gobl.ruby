# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Num
    class Amount < Model::Struct
      # Quantity with optional decimal places that determine accuracy.
      attribute :value, Model::Types::String.optional

      def self.from_gobl!(gobl)
        new(
          value: gobl
        )
      end

      def to_gobl
        value
      end
    end
  end
end
