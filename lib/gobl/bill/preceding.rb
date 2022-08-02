# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.29.0
##

require 'dry-struct'

module GOBL
  module Bill
    # Preceding allows for information to be provided about a previous invoice that this one will replace or subtract from.
    class Preceding < Dry::Struct
      # Preceding document's UUID if available can be useful for tracing.
      attribute :uuid, GOBL::UUID::UUID.optional

      # Identity code of the previous invoice.
      attribute :code, GOBL::Types::String

      # Additional identification details
      attribute :series, GOBL::Types::String.optional

      # When the preceding invoice was issued.
      attribute :issue_date, GOBL::Cal::Date

      # Tax period in which the previous invoice has an effect.
      attribute :period, GOBL::Cal::Period.optional

      # Specific codes for the corrections made.
      attribute :corrections, GOBL::Types::Array.of(GOBL::Types::String).optional

      # How has the previous invoice been corrected?
      attribute :correction_method, GOBL::Types::String.optional

      # Additional details regarding preceding invoice
      attribute :notes, GOBL::Types::String.optional

      # Additional semi-structured data that may be useful in specific regions
      attribute :meta, GOBL::Org::Meta.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          uuid: data['uuid'] ? GOBL::UUID::UUID.from_gobl!(data['uuid']) : nil,
          code: data['code'],
          series: data['series'],
          issue_date: GOBL::Cal::Date.from_gobl!(data['issue_date']),
          period: data['period'] ? GOBL::Cal::Period.from_gobl!(data['period']) : nil,
          corrections: data['corrections']&.map { |item| item },
          correction_method: data['correction_method'],
          notes: data['notes'],
          meta: data['meta'] ? GOBL::Org::Meta.from_gobl!(data['meta']) : nil
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
          'meta' => attributes[:meta]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

