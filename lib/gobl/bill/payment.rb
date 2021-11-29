# frozen_string_literal: true

module GOBL
  module Bill
    class Payment < Dynamic::Base
      attribute :terms, GOBL::Pay::Terms.optional
      attribute :methods, Dynamic::Types::Array(GOBL::Pay::Method).optional
      attribute :payer, GOBL::Org::Party.optional

      def self.refs
        @refs ||= {
          'terms' => GOBL::Pay::Terms,
          'methods' => GOBL::Pay::Method,
          'payer' => GOBL::Org::Party
        }
      end
    end
  end
end
