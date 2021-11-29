# frozen_string_literal: true

module GOBL
  module Bill
    class Preceding < Dynamic::Base
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :code, Dynamic::Types::String
      attribute :issue_date, GOBL::Org::Date
      attribute :meta, Dynamic::Types::Hash.optional

      def self.refs
        @refs ||= {
          'uuid' => GOBL::UUID::UUID,
          'code' => nil,
          'issue_date' => GOBL::Org::Date,
          'meta' => nil
        }
      end
    end
  end
end
