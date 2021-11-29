# frozen_string_literal: true

module GOBL
  module Org
    class Discount < Dynamic::Base
      attribute :rate, GOBL::Num::Percentage.optional
      attribute :value, GOBL::Num::Amount
      attribute :reason, Dynamic::Types::String.optional
      attribute :code, Dynamic::Types::String.optional

      def self.refs
        @refs ||= {
          'rate' => GOBL::Num::Percentage,
          'value' => GOBL::Num::Amount,
          'reason' => nil,
          'code' => nil
        }
      end
    end
  end
end
