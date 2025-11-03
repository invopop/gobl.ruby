# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Org
    # Unit defines how the quantity of the product should be interpreted either using a GOBL lower-case key (e.g. 'kg'), or UN/ECE code upper-case code (e.g. 'KGM').
    class Unit < String
      # The Schema ID of the GOBL Unit structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/unit'

      include GOBL::Enum

      ENUM = {
        'mg' => 'Milligrams',
        'g' => 'Metric grams',
        'kg' => 'Metric kilograms',
        't' => 'Metric tons',
        'mm' => 'Milimetres',
        'cm' => 'Centimetres',
        'dm' => 'A unit of length equal to one-tenth of a metre.',
        'm' => 'Metres',
        'km' => 'Kilometers',
        'in' => 'Inches',
        'ft' => 'Feet',
        'mm2' => 'Square millimetres',
        'cm2' => 'Square centimetres',
        'dm2' => 'Square decimetres',
        'm2' => 'Square metres',
        'ac' => 'A unit of area equal to 43,560 square feet.',
        'ha' => 'A unit of area equal to 10,000 square metres.',
        'mm3' => 'Cubic millimetres',
        'cm3' => 'Cubic centimetres',
        'dm3' => 'Cubic decimetres',
        'm3' => 'Cubic metres',
        'ml' => 'Millilitres',
        'cl' => 'Centilitres',
        'l' => 'Litres',
        'w' => 'Watts',
        'kw' => 'Kilowatts',
        'kwh' => 'Kilowatt Hours',
        'rate' => 'A unit of quantity expressed as a rate for usage of a facility or service.',
        'mon' => 'Unit of time equal to 1/12 of a year of 365,25 days.',
        'day' => 'Days',
        's' => 'Seconds',
        'h' => 'Hours',
        'min' => 'Minutes',
        'piece' => 'A unit of count defining the number of pieces (piece: a single item, article or exemplar).',
        'item' => ' A unit of count defining the number of items regarded as separate units.',
        'pair' => 'A unit of count defining the number of pairs (pair: item described by twos).s).',
        'dozen' => 'A unit of count defining the number of units in multiples of 12.',
        'assortment' => 'A unit of count defining the number of assortments (assortment: a collection of items or components of a single product packaged together).',
        'service' => 'A unit of count defining the number of service units (service unit: defined period / property / facility / utility of supply).',
        'job' => 'A unit of count defining the number of jobs.',
        'activity' => 'A unit of count defining the number of activities (activity: a unit of work or action).',
        'trip' => 'A unit of count defining the number of trips (trip: a journey to a place and back again).',
        'group' => 'A unit of count defining the number of groups (group: set of items classified together).',
        'outfit' => 'A unit of count defining the number of outfits (outfit: a complete set of equipment / materials / objects used for a specific purpose).',
        'kit' => 'A unit of count defining the number of kits (kit: tub, barrel or pail).',
        'basebox' => 'A unit of area of 112 sheets of tin mil products (tin plate, tin free steel or black plate) 14 by 20 inches, or 31,360 square inches.',
        'pk' => 'A unit of count defining the number of items per bulk pack.',
        'one' => 'A single generic unit of a service or product.',
        'bag' => 'Bags',
        'box' => 'Boxes',
        'bin' => 'Bins',
        'can' => 'Cans',
        'tub' => 'Tubs',
        'case' => 'Cases',
        'tray' => 'Trays',
        'portion' => 'Portions',
        'set' => 'A unit of count defining the number of sets (set: a number of objects grouped together).',
        'roll' => 'Rolls',
        'carton' => 'Cartons',
        'cylinder' => 'Cylinders',
        'barrel' => 'Barrels',
        'jerrican' => 'Jerrican, cylindrical',
        'carboy' => 'Carboys',
        'demijohn' => 'Demijohn',
        'bottle' => 'Bottles',
        '6pack' => 'Six Packs',
        'canister' => 'Canisters',
        'pkg' => 'Standard packaging unit.',
        'bunch' => 'Bunches',
        'tetrabrik' => 'Tetra-Briks',
        'pallet' => 'Pallets',
        'reel' => 'Reels',
        'sack' => 'Sacks',
        'sheet' => 'Sheets',
        'envelope' => 'Envelopes',
        'lot' => 'Lot',
        'unit' => 'A type of package composed of a single item or object, not otherwise specified as a unit of transport equipment.'
      }.freeze

      def strict_enum?
        false
      end
    end
  end
end
