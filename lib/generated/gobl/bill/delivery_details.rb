# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # DeliveryDetails covers the details of the destination for the products described in the invoice body.
    class DeliveryDetails < GOBL::Object
      # The Schema ID of the GOBL DeliveryDetails structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/delivery-details'

      # @!attribute [r] receiver
      # The party who will receive delivery of the goods defined in the invoice and is not responsible for taxes.
      # @return [GOBL::Org::Party]
      property :receiver, GOBL::Org::Party

      # @!attribute [r] identities
      # Identities is used to define specific codes or IDs that may be used to identify the delivery.
      # @return [Array<GOBL::Org::Identity>]
      property :identities, [GOBL::Org::Identity]

      # @!attribute [r] date
      # When the goods should be expected.
      # @return [GOBL::Cal::Date]
      property :date, GOBL::Cal::Date

      # @!attribute [r] period
      # Period of time in which to expect delivery if a specific date is not available.
      # @return [GOBL::Cal::Period]
      property :period, GOBL::Cal::Period

      # @!attribute [r] meta
      # Additional custom data.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
