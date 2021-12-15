# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Currency
    class ExchangeRate < Model::Struct
      attribute :currency, Model::Types::String
      attribute :value, GOBL::Num::Amount

      def self.properties_ref
        @properties_ref ||= {
          'currency' => nil,
          'value' => GOBL::Num::Amount
        }
      end
    end
  end
end
