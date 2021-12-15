# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class CategoryTotal < Model::Struct
      attribute :code, Model::Types::String
      attribute :retained, Model::Types::Bool.optional
      attribute :rates, Model::Types::Array(GOBL::Tax::RateTotal)
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
