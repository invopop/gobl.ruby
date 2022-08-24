# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Pay
    # Payment terms key
    class TermKey < GOBL::Struct
      ENUM = {
        '' => 'Not yet defined',
        'end-of-month' => 'End of month',
        'due-date' => 'Due on a specific date',
        'deferred' => 'Deferred until after the due date',
        'proximo' => 'Month after the present',
        'instant' => 'On receipt of invoice',
        'elective' => 'Chosen by the buyer',
        'pending' => 'Seller to advise buyer in separate transaction',
        'advance' => 'Payment made in advance',
        'delivery' => 'Payment on Delivery'
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

