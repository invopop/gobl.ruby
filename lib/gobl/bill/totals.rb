# frozen_string_literal: true

module GOBL
  module Bill
    class Totals < Dynamic::Base
      attribute :sum, GOBL::Num::Amount
      attribute :discount, GOBL::Num::Amount.optional
      attribute :total, GOBL::Num::Amount.optional
      attribute :taxes, GOBL::Tax::Total.optional
      attribute :outlays, GOBL::Num::Amount.optional
      attribute :payable, GOBL::Num::Amount

      def self.refs
        @refs ||= {
          'sum' => GOBL::Num::Amount,
          'discount' => GOBL::Num::Amount,
          'total' => GOBL::Num::Amount,
          'taxes' => GOBL::Tax::Total,
          'outlays' => GOBL::Num::Amount,
          'payable' => GOBL::Num::Amount
        }
      end
    end
  end
end
