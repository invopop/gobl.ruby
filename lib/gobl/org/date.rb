# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Date < Dynamic::Struct
      attribute :literal, Dynamic::Types::Any.optional

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
