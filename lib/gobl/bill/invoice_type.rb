# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

require 'dry-struct'

module GOBL
  module Bill
    # Defines an invoice type according to a subset of the UNTDID 1001 standard list.
    class InvoiceType < Dry::Struct
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
        when String
        super _value: object

        when Symbol
        super _value: lookup_enum_key_from_sym(object)

        else
          if object.respond_to?(:to_s)
        super _value: object.to_s
      else
        super
      end

        end
      end

      def to_sym
        self.class.enum_key_to_sym(to_s)
      end

      def self.lookup_enum_key_from_sym(sym)
        ENUM.keys.find { |key| enum_key_to_sym(key) == sym }
      end

      def self.enum_key_to_sym(object)
        object.underscore.to_sym
      end

      def description
        ENUM.fetch(_value, _value)
      end

      def respond_to_missing?(method_name, include_private = false)
        inquired_key(method_name).present? || super
      end

      def method_missing(method_name, *args, &block)
        if value = inquired_key(method_name)
          _value == value
        else
          super
        end
      end

      def inquired_key(method_name)
        method_name =~ /(.+)\?$/ && self.class.lookup_enum_key_from_sym($1.to_sym)
      end
    end
  end
end

