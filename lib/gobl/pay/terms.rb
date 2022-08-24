# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

require 'dry-struct'

module GOBL
  module Pay
    # Terms defines when we expect the customer to pay, or have paid, for the contents of the document.
    class Terms < Dry::Struct
      # Type of terms to be applied.
      attribute :key, TermKey

      # Text detail of the chosen payment terms.
      attribute :detail, GOBL::Types::String.optional

      # Set of dates for agreed payments.
      attribute :due_dates, GOBL::Types::Array.of(DueDate).optional

      # Description of the conditions for payment.
      attribute :notes, GOBL::Types::String.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          key: TermKey.from_gobl!(data['key']),
          detail: data['detail'],
          due_dates: data['due_dates']&.map { |item| DueDate.from_gobl!(item) },
          notes: data['notes']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'key' => attributes[:key]&.to_gobl,
          'detail' => attributes[:detail],
          'due_dates' => attributes[:due_dates]&.map { |item| item&.to_gobl },
          'notes' => attributes[:notes]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

