# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.69.0
##

module GOBL
  module Regimes
    module Mx
      # FuelAccountTax represents a single tax applied to a fuel purchase.
      class FuelAccountTax < GOBL::Object
        # The Schema ID of the GOBL FuelAccountTax structure
        SCHEMA_ID = 'https://gobl.org/draft-0/regimes/mx/fuel-account-balance#/$defs/FuelAccountTax'

        # @!attribute [r] code
        # Code that identifies the tax ("IVA" or "IEPS", maps to `Impuesto`)
        # @return [GOBL::CBC::Code]
        property :code, GOBL::CBC::Code
        validates_presence_of :code

        # @!attribute [r] rate
        # Rate applicable to either the line total (tasa) or the line quantity (cuota) (maps to `TasaOCuota`).
        # @return [GOBL::Num::Amount]
        property :rate, GOBL::Num::Amount
        validates_presence_of :rate

        # @!attribute [r] amount
        # Total amount of the tax once the rate has been applied (maps to `Importe`).
        # @return [GOBL::Num::Amount]
        property :amount, GOBL::Num::Amount
        validates_presence_of :amount
      end
    end
  end
end
