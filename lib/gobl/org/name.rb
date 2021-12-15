# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Name < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :alias, Model::Types::String.optional
      attribute :prefix, Model::Types::String.optional
      attribute :given, Model::Types::String
      attribute :middle, Model::Types::String.optional
      attribute :surname, Model::Types::String
      attribute :surname2, Model::Types::String.optional
      attribute :suffix, Model::Types::String.optional
      attribute :meta, Model::Types::Hash.optional

      def self.properties_ref
        @properties_ref ||= {
          'uuid' => GOBL::UUID::UUID,
          'alias' => nil,
          'prefix' => nil,
          'given' => nil,
          'middle' => nil,
          'surname' => nil,
          'surname2' => nil,
          'suffix' => nil,
          'meta' => nil
        }
      end
    end
  end
end
