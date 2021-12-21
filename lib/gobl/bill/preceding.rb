# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Bill
    class Preceding < Model::Struct
      # Preceding document's UUID if available can be useful for tracing.
      attribute :uuid, Model::Types::String.optional

      # Identity code of the previous invoice.
      attribute :code, Model::Types::String

      # When the preceding invoices was issued.
      attribute :issue_date, Model::Types::String

      # Additional semi-structured data that may be useful in specific regions.
      attribute :meta, Model::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          code: gobl['code'],
          issue_date: gobl['issue_date'],
          meta: gobl['meta']
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
          'code' => attributes[:code],
          'issue_date' => attributes[:issue_date],
          'meta' => attributes[:meta]
        }
      end
    end
  end
end
