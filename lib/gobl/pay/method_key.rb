# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

require 'dry-struct'

module GOBL
  module Pay
    # Method Key describes how a payment should be made
    class MethodKey < Dry::Struct
      ENUM = {
        'any' => 'Any method available, no preference',
        'card' => 'Credit or debit card',
        'credit-transfer' => 'Send initiated bank or wire transfer',
        'debit-transfer' => 'Receive initiated bank or wire transfer',
        'cash' => 'Cash',
        'direct-debit' => 'Direct debit',
        'online' => 'Online or web payment'
      }

      attribute :_value, GOBL::Types::String.enum(*ENUM.keys)

      def self.from_gobl!(data)
        new(_value: data)
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        _value
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end

      def to_s
        _value.to_s
      end

      def self.to_sym(object)
        object.to_s.underscore.to_sym
      end

      def to_sym
        self.class.to_sym(self)
      end

      def ==(other)
        case other
        when self.class
          super
        when String
          to_s == other
        when Symbol
          to_sym == other
        else
          if other.respond_to?(:to_s)
            self == other.to_s
          else
            super
          end
        end
      end

      def self.new(object)
        case object
        when Hash, self
          super
        when String #FIXME: type might not be String
          super _value: object
        when Symbol
        super _value: ENUM.keys.find { |key| to_sym(key) == object }

        else
          if object.respond_to?(:to_s)
            super _value: object.to_s
          end
        end
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

