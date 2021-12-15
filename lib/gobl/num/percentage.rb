# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Num
    class Percentage < Model::Struct
      attribute :literal, Model::Types::Any.optional

      def self.from_literal!(literal_value)
        new(literal: literal_value)
      end

      def self.properties_ref
        @properties_ref ||= {

        }
      end
    end
  end
end
