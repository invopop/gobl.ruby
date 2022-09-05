# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Org
    # Unit describes how the quantity of the product should be interpreted.
    class Unit < GOBL::Struct
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

      def to_gobl
        _value
      end

      def self.new(object)
        case object
        when Hash, self
          super
        when Symbol
          new find_by_sym(object) || object.to_s
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

