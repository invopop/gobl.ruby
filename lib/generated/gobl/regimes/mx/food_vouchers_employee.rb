# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.69.0
##

module GOBL
  module Regimes
    module Mx
      # FoodVouchersEmployee represents an employee that received a food voucher.
      class FoodVouchersEmployee < GOBL::Object
        # The Schema ID of the GOBL FoodVouchersEmployee structure
        SCHEMA_ID = 'https://gobl.org/draft-0/regimes/mx/food-vouchers#/$defs/FoodVouchersEmployee'

        # @!attribute [r] tax_code
        # Employee's tax identity code (maps to `rfc`).
        # @return [GOBL::CBC::Code]
        property :tax_code, GOBL::CBC::Code
        validates_presence_of :tax_code

        # @!attribute [r] curp
        # Employee's CURP ("Clave Única de Registro de Población", maps to `curp`).
        # @return [GOBL::CBC::Code]
        property :curp, GOBL::CBC::Code
        validates_presence_of :curp

        # @!attribute [r] name
        # Employee's name (maps to `nombre`).
        # @return [String]
        property :name, String
        validates_presence_of :name

        # @!attribute [r] social_security
        # Employee's Social Security Number (maps to `numSeguridadSocial`).
        # @return [GOBL::CBC::Code]
        property :social_security, GOBL::CBC::Code
      end
    end
  end
end
