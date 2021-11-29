# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class RateTotal < Dynamic::Struct
      attribute :code, Dynamic::Types::String
      attribute :base, GOBL::Num::Amount
      attribute :percent, GOBL::Num::Percentage
      attribute :value, GOBL::Num::Amount

      def self.properties_ref
        @properties_ref ||= {
          'code' => nil,
          'base' => GOBL::Num::Amount,
          'percent' => GOBL::Num::Percentage,
          'value' => GOBL::Num::Amount
        }
      end
    end
  end
end
