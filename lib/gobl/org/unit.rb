# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.34.1
##

module GOBL
  module Org
    # Unit describes how the quantity of the product should be interpreted.
    class Unit < GOBL::Enum
      # The Schema ID of the GOBL Unit structure
      SCHEMA_ID = 'https://gobl.org/draft-0/org/unit'

      # The enumeration of values of the object and their descriptions (Values different to these are also allowed)
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
      }.freeze
    end
  end
end
