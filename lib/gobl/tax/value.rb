# frozen_string_literal: true

module GOBL
  module Tax
    class Value < Dynamic::Base
      attribute :since, GOBL::Org::Date.optional
      attribute :percent, GOBL::Num::Percentage
      attribute :disabled, Dynamic::Types::Bool.optional

      def self.refs
        @refs ||= {
          'since' => GOBL::Org::Date,
          'percent' => GOBL::Num::Percentage,
          'disabled' => nil
        }
      end
    end
  end
end
