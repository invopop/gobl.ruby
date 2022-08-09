# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.29.0
##

require 'dry-struct'

module GOBL
  module Tax
    # NoteKey identifies the type of note being edited
    class NoteKey < Dry::Struct
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

      attribute :_value, GOBL::Types::Any.enum(*ENUM.keys)

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

      def description
        ENUM.fetch(_value, _value)
      end
    end
  end
end

