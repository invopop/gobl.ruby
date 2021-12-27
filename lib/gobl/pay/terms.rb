# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Pay
    class Terms < Dry::Struct
      # Type of terms to be applied.
      attribute :code, GOBL::Types::String

      # Text detail of the chosen payment terms.
      attribute :detail, GOBL::Types::String.optional

      # Set of dates for agreed payments.
      attribute :due_dates, GOBL::Types::Array(GOBL::Pay::DueDate).optional

      # Description of the conditions for payment.
      attribute :notes, GOBL::Types::String.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          code: gobl['code'],
          detail: gobl['detail'],
          due_dates: gobl['due_dates']&.map { |x| GOBL::Pay::DueDate.from_gobl!(x) },
          notes: gobl['notes']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'detail' => attributes[:detail],
          'due_dates' => attributes[:due_dates]&.map { |x| x&.to_gobl },
          'notes' => attributes[:notes]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
