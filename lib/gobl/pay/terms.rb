# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Pay
    # Terms defines when we expect the customer to pay, or have paid, for the contents of the document.
    class Terms < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/pay/terms'

      # @!attribute [r] key
      # Type of terms to be applied.
      # @return [TermKey]
      attribute :key, TermKey

      # @!attribute [r] detail
      # Text detail of the chosen payment terms.
      # @return [String]
      attribute? :detail, GOBL::Types::String.optional

      # @!attribute [r] due_dates
      # Set of dates for agreed payments.
      # @return [Array<DueDate>]
      attribute? :due_dates, GOBL::Types::Array.of(DueDate).optional

      # @!attribute [r] notes
      # Description of the conditions for payment.
      # @return [String]
      attribute? :notes, GOBL::Types::String.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          key: TermKey.from_gobl!(data['key']),
          detail: data['detail'],
          due_dates: data['due_dates']&.map { |item| DueDate.from_gobl!(item) },
          notes: data['notes']
        )
      end

      def to_gobl
        {
          'key' => attributes[:key]&.to_gobl,
          'detail' => attributes[:detail],
          'due_dates' => attributes[:due_dates]&.map { |item| item&.to_gobl },
          'notes' => attributes[:notes]
        }.compact
      end
    end
  end
end

