# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class CategoryTotal < Dynamic::Struct
      attribute :code, Dynamic::Types::String
      attribute :retained, Dynamic::Types::Bool.optional
      attribute :rates, Dynamic::Types::Array(GOBL::Tax::RateTotal)
      attribute :base, GOBL::Num::Amount
      attribute :value, GOBL::Num::Amount

      def self.properties_ref
        @properties_ref ||= {
          'code' => nil,
          'retained' => nil,
          'rates' => GOBL::Tax::RateTotal,
          'base' => GOBL::Num::Amount,
          'value' => GOBL::Num::Amount
        }
      end
    end
  end
end
