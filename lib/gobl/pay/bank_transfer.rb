# frozen_string_literal: true

module GOBL
  module Pay
    class BankTransfer < Dynamic::Base
      attribute :iban, Dynamic::Types::String.optional
      attribute :bic, Dynamic::Types::String.optional
      attribute :number, Dynamic::Types::String.optional
      attribute :name, Dynamic::Types::String.optional
      attribute :branch, GOBL::Org::Address.optional
      attribute :notes, GOBL::I18n::String.optional
      attribute :meta, Dynamic::Types::Hash.optional

      def self.refs
        @refs ||= {
          'iban' => nil,
          'bic' => nil,
          'number' => nil,
          'name' => nil,
          'branch' => GOBL::Org::Address,
          'notes' => GOBL::I18n::String,
          'meta' => nil
        }
      end
    end
  end
end
