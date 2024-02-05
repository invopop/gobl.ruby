# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.67.0
##

module GOBL
  module Regimes
    module Mx
      # FoodVouchersLine represents a single food voucher issued to the e-wallet of one of the customer's employees.
      class FoodVouchersLine < GOBL::Object
        # The Schema ID of the GOBL FoodVouchersLine structure
        SCHEMA_ID = 'https://gobl.org/draft-0/regimes/mx/food-vouchers#/$defs/FoodVouchersLine'

        # @!attribute [r] e_wallet_id
        # Identifier of the e-wallet that received the food voucher (maps to `Identificador`).
        # @return [GOBL::CBC::Code]
        property :e_wallet_id, GOBL::CBC::Code
        validates_presence_of :e_wallet_id

        # @!attribute [r] issue_date_time
        # Date and time of the food voucher's issue (maps to `Fecha`).
        # @return [GOBL::Cal::DateTime]
        property :issue_date_time, GOBL::Cal::DateTime
        validates_presence_of :issue_date_time

        # @!attribute [r] employee
        # Employee that received the food voucher.
        # @return [FoodVouchersEmployee]
        property :employee, FoodVouchersEmployee

        # @!attribute [r] amount
        # Amount of the food voucher (maps to `importe`).
        # @return [GOBL::Num::Amount]
        property :amount, GOBL::Num::Amount
        validates_presence_of :amount
      end
    end
  end
end
