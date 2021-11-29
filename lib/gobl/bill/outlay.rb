# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Outlay < Dynamic::Struct
      attribute :uuid, Dynamic::Types::String.optional
      attribute :i, Dynamic::Types::Int
      attribute :ref, Dynamic::Types::String.optional
      attribute :desc, Dynamic::Types::String
      attribute :paid, GOBL::Num::Amount

      def self.properties_ref
        @properties_ref ||= {
          'uuid' => nil,
          'i' => nil,
          'ref' => nil,
          'desc' => nil,
          'paid' => GOBL::Num::Amount
        }
      end
    end
  end
end
