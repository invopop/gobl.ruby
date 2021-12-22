# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Org
    class Date < Model::Struct
      # Civil date in simplified ISO format, like 2021-05-26
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
