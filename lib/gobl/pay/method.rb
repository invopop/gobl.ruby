# frozen_string_literal: true

module GOBL
  module Pay
    class Method < Dynamic::Base
      attribute :code, Dynamic::Types::String
      attribute :bank_transfer, GOBL::Pay::BankTransfer.optional
      attribute :url, GOBL::Pay::URL.optional
      attribute :notes, Dynamic::Types::String.optional
      attribute :meta, Dynamic::Types::Hash.optional

      def self.refs
        @refs ||= {
          'code' => nil,
          'bank_transfer' => GOBL::Pay::BankTransfer,
          'url' => GOBL::Pay::URL,
          'notes' => nil,
          'meta' => nil
        }
      end
    end
  end
end
