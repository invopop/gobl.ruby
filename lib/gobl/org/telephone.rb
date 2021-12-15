# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Telephone < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :label, Model::Types::String.optional
      attribute :num, Model::Types::String

      def self.properties_ref
        @properties_ref ||= {
          'uuid' => GOBL::UUID::UUID,
          'label' => nil,
          'num' => nil
        }
      end
    end
  end
end
