# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Regimes
    module Mx
      # FuelAccountTax represents a single tax applied to a fuel purchase.
      class FuelAccountTax < GOBL::Object
        # The Schema ID of the GOBL FuelAccountTax structure
        SCHEMA_ID = 'https://gobl.org/draft-0/regimes/mx/fuel-account-balance#/$defs/FuelAccountTax'

        # @!attribute [r] cat
        # Category that identifies the tax ("VAT" or "IEPS", maps to `Impuesto`)
        # @return [GOBL::CBC::Code]
        property :cat, GOBL::CBC::Code
        validates_presence_of :cat

        # @!attribute [r] percent
        # Percent applicable to the line total (tasa) to use instead of Rate (maps to `TasaoCuota`)
        # @return [GOBL::Num::Percentage]
        property :percent, GOBL::Num::Percentage

        # @!attribute [r] rate
        # Rate is a fixed fee to apply to the line quantity (cuota) (maps to `TasaOCuota`)
        # @return [GOBL::Num::Amount]
        property :rate, GOBL::Num::Amount

        # @!attribute [r] amount
        # Total amount of the tax once the percent or rate has been applied (maps to `Importe`).
        # @return [GOBL::Num::Amount]
        property :amount, GOBL::Num::Amount
      end
    end
  end
end
