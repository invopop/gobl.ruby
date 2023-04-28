# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.42.4
##

module GOBL
  module Bill
    # Delivery covers the details of the destination for the products described in the invoice body.
    class Delivery < GOBL::Object
      # The Schema ID of the GOBL Delivery structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Delivery'

      # @!attribute [r] receiver
      # The party who will receive delivery of the goods defined in the invoice and is not responsible for taxes.
      # @return [GOBL::Org::Party]
      property :receiver, GOBL::Org::Party

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
