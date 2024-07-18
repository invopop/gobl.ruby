# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Bill
    # Ordering provides additional information about the ordering process including references to other documents and alternative parties involved in the order-to-delivery process.
    class Ordering < GOBL::Object
      # The Schema ID of the GOBL Ordering structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Ordering'

      # @!attribute [r] code
      # Identifier assigned by the customer or buyer for internal routing purposes.
      # @return [String]
      property :code, String

      # @!attribute [r] identities
      # Any additional Codes, IDs, SKUs, or other regional or custom identifiers that may be used to identify the order.
      # @return [Array<GOBL::Org::Identity>]
      property :identities, [GOBL::Org::Identity]

      # @!attribute [r] period
      # Period of time that the invoice document refers to often used in addition to the details provided in the individual line items.
      # @return [GOBL::Cal::Period]
      property :period, GOBL::Cal::Period

      # @!attribute [r] project
      # Project this invoice refers to.
      # @return [DocumentReference]
      property :project, DocumentReference

      # @!attribute [r] contract
      # The identification of a contract.
      # @return [DocumentReference]
      property :contract, DocumentReference

      # @!attribute [r] purchase
      # Purchase order issued by the customer or buyer.
      # @return [DocumentReference]
      property :purchase, DocumentReference

      # @!attribute [r] sale
      # Sales order issued by the supplier or seller.
      # @return [DocumentReference]
      property :sale, DocumentReference

      # @!attribute [r] receiving
      # Receiving Advice.
      # @return [DocumentReference]
      property :receiving, DocumentReference

      # @!attribute [r] despatch
      # Despatch advice.
      # @return [DocumentReference]
      property :despatch, DocumentReference

      # @!attribute [r] tender
      # Tender advice, the identification of the call for tender or lot the invoice relates to.
      # @return [DocumentReference]
      property :tender, DocumentReference

      # @!attribute [r] buyer
      # Party who is responsible for making the purchase, but is not responsible for handling taxes.
      # @return [GOBL::Org::Party]
      property :buyer, GOBL::Org::Party

      # @!attribute [r] seller
      # Party who is selling the goods but is not responsible for taxes like the supplier.
      # @return [GOBL::Org::Party]
      property :seller, GOBL::Org::Party
    end
  end
end
