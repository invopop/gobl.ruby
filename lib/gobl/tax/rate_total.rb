# frozen_string_literal: true

module GOBL
  module Tax
    class RateTotal < Dynamic::Base
      attribute :code, Dynamic::Types::String
      attribute :base, GOBL::Num::Amount
      attribute :percent, GOBL::Num::Percentage
      attribute :value, GOBL::Num::Amount

      def self.refs
        @refs ||= {
          'code' => nil,
          'base' => GOBL::Num::Amount,
          'percent' => GOBL::Num::Percentage,
          'value' => GOBL::Num::Amount
        }
      end
    end
  end
end
