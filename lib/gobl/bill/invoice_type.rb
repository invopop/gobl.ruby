# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # Defines an invoice type according to a subset of the UNTDID 1001 standard list.
    class InvoiceType < GOBL::Struct
      ENUM = {
        'proforma' => 'Proforma invoice, for a clients validation before sending a final invoice.',
        'simplified' => 'Simplified invoice or receipt typically used for small transactions that dont require customer details.t require customer details.',
        'partial' => 'Partial invoice',
        'commercial' => 'Commercial invoice, usually cross-border transactions requiring an invoice for customs.',
        'corrected' => 'Corrected invoice',
        'credit-note' => 'Credit note',
        'self-billed' => 'Self billed invoice'
      }

      attribute :_value, GOBL::Types::String.enum(*ENUM.keys)

      def self.from_gobl!(data)
        new(_value: data)
      end

      def to_gobl
        _value
      end

      def to_s
        _value.to_s
      end

      def description
        ENUM.fetch(_value, _value)
      end

      INQUIRERS = ENUM.keys.map { |key| [ "#{key.underscore}?".to_sym, key ] }.to_h

      def respond_to_missing?(method_name, include_private = false)
        INQUIRERS.has_key?(method_name) || super
      end

      def method_missing(method_name, *args, &block)
        if INQUIRERS.has_key?(method_name)
          _value == INQUIRERS[method_name]
        else
          super
        end
      end
    end
  end
end

