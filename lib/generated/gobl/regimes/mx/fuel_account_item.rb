# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Regimes
    module Mx
      # FuelAccountItem provides the details of a fuel purchase.
      class FuelAccountItem < GOBL::Object
        # The Schema ID of the GOBL FuelAccountItem structure
        SCHEMA_ID = 'https://gobl.org/draft-0/regimes/mx/fuel-account-balance#/$defs/FuelAccountItem'

        # @!attribute [r] type
        # Type of fuel (one of `c_ClaveTipoCombustible` codes, maps to `TipoCombustible`).
        # @return [GOBL::CBC::Code]
        property :type, GOBL::CBC::Code
        validates_presence_of :type

        # @!attribute [r] unit
        # Reference unit of measure used in the price and the quantity (maps to `Unidad`).
        # @return [GOBL::Org::Unit]
        property :unit, GOBL::Org::Unit

        # @!attribute [r] name
        # Name of the fuel (maps to `NombreCombustible`).
        # @return [String]
        property :name, String
        validates_presence_of :name

        # @!attribute [r] price
        # Base price of a single unit of the fuel without taxes (maps to `ValorUnitario`).
        # @return [GOBL::Num::Amount]
        property :price, GOBL::Num::Amount
        validates_presence_of :price
      end
    end
  end
end
