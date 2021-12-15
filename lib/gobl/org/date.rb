# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Date < Model::Struct
      attribute :literal, Model::Types::Any.optional

      def self.from_literal!(literal_value)
        new(literal: literal_value)
      end
    end
  end
end
