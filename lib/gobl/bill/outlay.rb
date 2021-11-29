# frozen_string_literal: true

module GOBL
  module Bill
    class Outlay < Dynamic::Base
      attribute :uuid, Dynamic::Types::String.optional
      attribute :i, Dynamic::Types::Int
      attribute :ref, Dynamic::Types::String.optional
      attribute :desc, Dynamic::Types::String
      attribute :paid, GOBL::Num::Amount

      def self.refs
        @refs ||= {
          'uuid' => nil,
          'i' => nil,
          'ref' => nil,
          'desc' => nil,
          'paid' => GOBL::Num::Amount
        }
      end
    end
  end
end
