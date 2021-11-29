# frozen_string_literal: true

module GOBL
  module Tax
    class Total < Dynamic::Base
      attribute :categories, Dynamic::Types::Array(GOBL::Tax::CategoryTotal).optional
      attribute :sum, GOBL::Num::Amount

      def self.refs
        @refs ||= {
          'categories' => GOBL::Tax::CategoryTotal,
          'sum' => GOBL::Num::Amount
        }
      end
    end
  end
end
