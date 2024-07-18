# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Regimes
    module Mx
      # FuelAccountBalance carries the data to produce a CFDI's "Complemento de Estado de Cuenta de Combustibles para Monederos Electrónicos" (version 1.2 revision B) providing detailed information about fuel purchases made with electronic wallets.
      class FuelAccountBalance < GOBL::Object
        # The Schema ID of the GOBL FuelAccountBalance structure
        SCHEMA_ID = 'https://gobl.org/draft-0/regimes/mx/fuel-account-balance'

        # @!attribute [r] account_number
        # Customer's account number (maps to `NumeroDeCuenta`).
        # @return [String]
        property :account_number, String
        validates_presence_of :account_number

        # @!attribute [r] subtotal
        # Sum of all line totals (i.e. taxes not included) (calculated, maps to `SubTotal`).
        # @return [GOBL::Num::Amount]
        property :subtotal, GOBL::Num::Amount

        # @!attribute [r] total
        # Grand total after taxes have been applied (calculated, maps to `Total`).
        # @return [GOBL::Num::Amount]
        property :total, GOBL::Num::Amount

        # @!attribute [r] lines
        # List of fuel purchases made with the customer's e-wallets (maps to `Conceptos`).
        # @return [Array<FuelAccountLine>]
        property :lines, [FuelAccountLine]
        validates_presence_of :lines
      end
    end
  end
end
