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

      # Identity code of the previous invoice.
      attribute :code, GOBL::Types::String

      # Additional identification details
      attribute :series, GOBL::Types::String.optional

      # When the preceding invoice was issued.
      attribute :issue_date, GOBL::Org::Date

      # Tax period in which the previous invoice has an effect.
      attribute :period, GOBL::Org::Period.optional

      # Specific codes for the corrections made.
      attribute :corrections, GOBL::Types::Array(GOBL::Types::String).optional

      # How has the previous invoice been corrected?
      attribute :correction_method, GOBL::Types::String.optional

      # Additional details regarding preceding invoice
      attribute :notes, GOBL::Types::String.optional

      # Additional semi-structured data that may be useful in specific regions
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          code: data['code'],
          series: data['series'],
          issue_date: GOBL::Org::Date.from_gobl!(data['issue_date']),
          period: data['period'] ? GOBL::Org::Period.from_gobl!(data['period']) : nil,
          corrections: data['corrections']&.map { |item| item },
          correction_method: data['correction_method'],
          notes: data['notes'],
          meta: data['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid]&.to_gobl,
          'code' => attributes[:code],
          'series' => attributes[:series],
          'issue_date' => attributes[:issue_date]&.to_gobl,
          'period' => attributes[:period]&.to_gobl,
          'corrections' => attributes[:corrections]&.map { |item| item },
          'correction_method' => attributes[:correction_method],
          'notes' => attributes[:notes],
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
