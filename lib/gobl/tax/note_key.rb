# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Tax
    # NoteKey identifies the type of note being edited
    class NoteKey < GOBL::Struct
      ENUM = {
        'goods' => 'Goods Description',
        'payment' => 'Terms of Payment',
        'legal' => 'Legal or regulatory information',
        'dangerous-goods' => 'Dangerous goods additional information',
        'ack' => 'Acknowledgement Description',
        'rate' => 'Rate additional information',
        'reason' => 'Reason',
        'dispute' => 'Dispute',
        'customer' => 'Customer remarks',
        'glossary' => 'Glossary',
        'customs' => 'Customs declaration information',
        'general' => 'General information',
        'handling' => 'Handling instructions',
        'packaging' => 'Packaging information',
        'loading' => 'Loading instructions',
        'price' => 'Price conditions',
        'priority' => 'Priority information',
        'regulatory' => 'Regulatory information',
        'safety' => 'Safety instructions',
        'ship-line' => 'Ship line',
        'supplier' => 'Supplier remarks',
        'transport' => 'Transportation information',
        'delivery' => 'Delivery information',
        'quarantine' => 'Quarantine information',
        'tax' => 'Tax declaration'
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
        to_s.parameterize.underscore.to_sym
      end

      def self.lookup_enum_key_from_sym(sym)
        all.find { |object| object.to_sym == sym }&._value #FIXME
      end

      def self.all
        ENUM.keys.map { |key| new(key) }
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

