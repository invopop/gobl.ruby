# frozen_string_literal: true

module GOBL
  module Bill
    class Delivery < Dynamic::Base
      attribute :receiver, GOBL::Org::Party.optional

      def self.refs
        @refs ||= {
          'receiver' => GOBL::Org::Party
        }
      end
    end
  end
end
