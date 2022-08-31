# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

require 'dry-struct'

module GOBL
  module Org
    # Unit describes how the quantity of the product should be interpreted.
    class Unit < Dry::Struct
      ENUM = {
        'g' => 'Metric grams',
        'kg' => 'Metric kilograms',
        't' => 'Metric tons',
        'mm' => 'Milimetres',
        'cm' => 'Centimetres',
        'm' => 'Metres',
        'km' => 'Kilometers',
        'in' => 'Inches',
        'ft' => 'Feet',
        'm2' => 'Square metres',
        'm3' => 'Cubic metres',
        'cl' => 'Centilitres',
        'l' => 'Litres',
        'w' => 'Watts',
        'kw' => 'Kilowatts',
        'kwh' => 'Kilowatt Hours',
        'day' => 'Days',
        's' => 'Seconds',
        'h' => 'Hours',
        'min' => 'Minutes',
        'piece' => 'Pieces',
        'bag' => 'Bags',
        'box' => 'Boxes',
        'bin' => 'Bins',
        'can' => 'Cans',
        'tub' => 'Tubs',
        'case' => 'Cases',
        'tray' => 'Trays',
        'portion' => 'Portions',
        'dozen' => 'Dozens',
        'roll' => 'Rolls',
        'carton' => 'Cartons',
        'cylinder' => 'Cylinders',
        'barrel' => 'Barrels',
        'jerrican' => 'Jerricans',
        'carboy' => 'Carboys',
        'demijohn' => 'Demijohn',
        'bottle' => 'Bottles',
        '6pack' => 'Six Packs',
        'canister' => 'Canisters',
        'pkg' => 'Packages',
        'bunch' => 'Bunches',
        'tetrabrik' => 'Tetra-Briks',
        'pallet' => 'Pallets',
        'reel' => 'Reels',
        'sack' => 'Sacks',
        'sheet' => 'Sheets',
        'envelope' => 'Envelopes'
      }

      attribute :_value, GOBL::Types::String

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

