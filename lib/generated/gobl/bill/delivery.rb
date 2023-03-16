# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.38.0
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
      # When the goods should be expected
      # @return [GOBL::Cal::Date]
      property :date, GOBL::Cal::Date

      # @!attribute [r] start_date
      # Start of an invoicing or delivery period
      # @return [GOBL::Cal::Date]
      property :start_date, GOBL::Cal::Date

      # @!attribute [r] end_date
      # End of an invoicing or delivery period
      # @return [GOBL::Cal::Date]
      property :end_date, GOBL::Cal::Date
    end
  end
end
