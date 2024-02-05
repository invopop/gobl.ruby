# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.67.0
##

module GOBL
  module Regimes
    module Mx
      # FoodVouchers carries the data to produce a CFDI's "Complemento de Vales de Despensa" (version 1.0) providing detailed information about food vouchers issued by an e-wallet supplier to its customer's employees.
      class FoodVouchers < GOBL::Object
        # The Schema ID of the GOBL FoodVouchers structure
        SCHEMA_ID = 'https://gobl.org/draft-0/regimes/mx/food-vouchers'

        # @!attribute [r] employer_registration
        # Customer's employer registration number (maps to `registroPatronal`).
        # @return [String]
        property :employer_registration, String

        # @!attribute [r] account_number
        # Customer's account number (maps to `numeroDeCuenta`).
        # @return [String]
        property :account_number, String
        validates_presence_of :account_number

        # @!attribute [r] total
        # Sum of all line amounts (calculated, maps to `total`).
        # @return [GOBL::Num::Amount]
        property :total, GOBL::Num::Amount

        # @!attribute [r] lines
        # List of food vouchers issued to the customer's employees (maps to `Conceptos`).
        # @return [Array<FoodVouchersLine>]
        property :lines, [FoodVouchersLine]
        validates_presence_of :lines
      end
    end
  end
end
