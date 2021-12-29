# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Preceding < Dry::Struct
      # Preceding document's UUID if available can be useful for tracing.
      attribute :uuid, GOBL::UUID::UUID.optional

      # Identity code fo the previous invoice.
      attribute :code, GOBL::Types::String

      # When the preceding invoice was issued.
      attribute :issue_date, GOBL::Org::Date

      # Additional semi-structured data that may be useful in specific regions
      attribute :preceding_meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'] ? GOBL::UUID::UUID.from_gobl!(gobl['uuid']) : nil,
          code: gobl['code'],
          issue_date: GOBL::Org::Date.from_gobl!(gobl['issue_date']),
          preceding_meta: gobl['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'code' => attributes[:code],
          'issue_date' => attributes[:issue_date]&.to_gobl,
          'meta' => attributes[:preceding_meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
