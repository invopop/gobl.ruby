# frozen_string_literal: true

module GOBL
  module Bill
    class Ordering < Dynamic::Base
      attribute :seller, GOBL::Org::Party.optional

      def self.refs
        @refs ||= {
          'seller' => GOBL::Org::Party
        }
      end
    end
  end
end
