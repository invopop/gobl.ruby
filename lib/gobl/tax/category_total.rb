# frozen_string_literal: true

module GOBL
  module Tax
    class CategoryTotal < Dynamic::Base
      attribute :code, Dynamic::Types::String
      attribute :retained, Dynamic::Types::Bool.optional
      attribute :rates, Dynamic::Types::Array(GOBL::Tax::RateTotal)
      attribute :base, GOBL::Num::Amount
      attribute :value, GOBL::Num::Amount

      def self.refs
        @refs ||= {
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
