# frozen_string_literal: true

module GOBL
  module Currency
    class ExchangeRate < Dynamic::Base
      attribute :currency, Dynamic::Types::String
      attribute :value, GOBL::Num::Amount

      def self.refs
        @refs ||= {
          'currency' => nil,
          'value' => GOBL::Num::Amount
        }
      end
    end
  end
end
