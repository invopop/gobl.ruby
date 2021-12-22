# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Num
    class Percentage < Model::Struct
      # Similar to an Amount, but designed for percentages and includes % symbol in JSON output.
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
