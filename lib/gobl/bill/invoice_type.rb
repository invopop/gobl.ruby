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

      def self.new(object)
        case object
        when Hash, self
          super
        when Symbol
          new find_by_sym(object)
        else
          super _value: object.to_s
        end
      end

      def to_s
        _value.to_s
      end

      def ==(other)
        case other
        when self.class
          super
        when Symbol
          to_sym == other
        else
          to_s == other.to_s
        end
      end

      def to_sym
        to_s.parameterize.underscore.to_sym
      end

      def self.all
        ENUM.keys.map { |key| new(key) }
      end

      def self.find_by_sym(sym)
        all.find { |object| object.to_sym == sym }
      end

      def self.find_by_inquirer(method_name)
        method_name =~ /(.+)\?$/ && find_by_sym($1.to_sym)
      end

      def description
        ENUM.fetch(_value, _value)
      end

      def respond_to_missing?(method_name, include_private = false)
        self.class.find_by_inquirer(method_name) || super
      end

      def method_missing(method_name, *args, &block)
        if value = self.class.find_by_inquirer(method_name)
          self == value
        else
          super
        end
      end
    end
  end
end

