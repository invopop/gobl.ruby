# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Discount < Dynamic::Struct
      attribute :rate, GOBL::Num::Percentage.optional
      attribute :value, GOBL::Num::Amount
      attribute :reason, Dynamic::Types::String.optional
      attribute :code, Dynamic::Types::String.optional

      def self.properties_ref
        @properties_ref ||= {
          'rate' => GOBL::Num::Percentage,
          'value' => GOBL::Num::Amount,
          'reason' => nil,
          'code' => nil
        }
      end
    end
  end
end
