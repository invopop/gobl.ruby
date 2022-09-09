# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # Preceding allows for information to be provided about a previous invoice that this one will replace or subtract from.
    class Preceding < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Preceding'

      # @!attribute [r] uuid
      # Preceding document's UUID if available can be useful for tracing.
      # @return [GOBL::UUID::UUID]
      attribute? :uuid, GOBL::UUID::UUID.optional

      # @!attribute [r] code
      # Identity code of the previous invoice.
      # @return [String]
      attribute :code, GOBL::Types::String

      # @!attribute [r] series
      # Additional identification details
      # @return [String]
      attribute? :series, GOBL::Types::String.optional

      # @!attribute [r] issue_date
      # When the preceding invoice was issued.
      # @return [GOBL::Cal::Date]
      attribute :issue_date, GOBL::Cal::Date

      # @!attribute [r] period
      # Tax period in which the previous invoice has an effect.
      # @return [GOBL::Cal::Period]
      attribute? :period, GOBL::Cal::Period.optional

      # @!attribute [r] corrections
      # Specific codes for the corrections made.
      # @return [Array<String>]
      attribute? :corrections, GOBL::Types::Array.of(GOBL::Types::String).optional

      # @!attribute [r] correction_method
      # How has the previous invoice been corrected?
      # @return [String]
      attribute? :correction_method, GOBL::Types::String.optional

      # @!attribute [r] notes
      # Additional details regarding preceding invoice
      # @return [String]
      attribute? :notes, GOBL::Types::String.optional

      # @!attribute [r] meta
      # Additional semi-structured data that may be useful in specific regions
      # @return [GOBL::Org::Meta]
      attribute? :meta, GOBL::Org::Meta.optional

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
        }.compact
      end
    end
  end
end

