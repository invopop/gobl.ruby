# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Currency
    class ExchangeRate < Dynamic::Struct
      attribute :currency, Dynamic::Types::String
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
