# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.69.0
##

module GOBL
  module Regimes
    module Mx
      # FuelAccountLine represents a single fuel purchase made with an e-wallet issued by the invoice's supplier.
      class FuelAccountLine < GOBL::Object
        # The Schema ID of the GOBL FuelAccountLine structure
        SCHEMA_ID = 'https://gobl.org/draft-0/regimes/mx/fuel-account-balance#/$defs/FuelAccountLine'

        # @!attribute [r] e_wallet_id
        # Identifier of the e-wallet used to make the purchase (maps to `Identificador`).
        # @return [GOBL::CBC::Code]
        property :e_wallet_id, GOBL::CBC::Code
        validates_presence_of :e_wallet_id

        # @!attribute [r] purchase_date_time
        # Date and time of the purchase (maps to `Fecha`).
        # @return [GOBL::Cal::DateTime]
        property :purchase_date_time, GOBL::Cal::DateTime
        validates_presence_of :purchase_date_time

        # @!attribute [r] vendor_tax_code
        # Tax Identity Code of the fuel's vendor (maps to `Rfc`)
        # @return [GOBL::CBC::Code]
        property :vendor_tax_code, GOBL::CBC::Code
        validates_presence_of :vendor_tax_code

        # @!attribute [r] service_station_code
        # Code of the service station where the purchase was made (maps to `ClaveEstacion`).
        # @return [GOBL::CBC::Code]
        property :service_station_code, GOBL::CBC::Code
        validates_presence_of :service_station_code

        # @!attribute [r] quantity
        # Amount of fuel units purchased (maps to `Cantidad`)
        # @return [GOBL::Num::Amount]
        property :quantity, GOBL::Num::Amount
        validates_presence_of :quantity

        # @!attribute [r] item
        # Details of the fuel purchased.
        # @return [FuelAccountItem]
        property :item, FuelAccountItem
        validates_presence_of :item

        # @!attribute [r] purchase_code
        # Identifier of the purchase (maps to `FolioOperacion`).
        # @return [GOBL::CBC::Code]
        property :purchase_code, GOBL::CBC::Code
        validates_presence_of :purchase_code

        # @!attribute [r] total
        # Result of quantity multiplied by the unit price (maps to `Importe`).
        # @return [GOBL::Num::Amount]
        property :total, GOBL::Num::Amount
        validates_presence_of :total

        # @!attribute [r] taxes
        # Map of taxes applied to the purchase (maps to `Traslados`).
        # @return [Array<FuelAccountTax>]
        property :taxes, [FuelAccountTax]
        validates_presence_of :taxes
      end
    end
  end
end
