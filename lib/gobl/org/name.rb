# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Name < Dynamic::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :alias, Dynamic::Types::String.optional
      attribute :prefix, Dynamic::Types::String.optional
      attribute :given, Dynamic::Types::String
      attribute :middle, Dynamic::Types::String.optional
      attribute :surname, Dynamic::Types::String
      attribute :surname2, Dynamic::Types::String.optional
      attribute :suffix, Dynamic::Types::String.optional
      attribute :meta, Dynamic::Types::Hash.optional

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
