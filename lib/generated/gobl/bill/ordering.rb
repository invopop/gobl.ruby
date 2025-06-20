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
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/ordering'

      # @!attribute [r] code
      # Identifier assigned by the customer or buyer for internal routing purposes.
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code

      # @!attribute [r] identities
      # Any additional Codes, IDs, SKUs, or other regional or custom identifiers that may be used to identify the order.
      # @return [Array<GOBL::Org::Identity>]
      property :identities, [GOBL::Org::Identity]

      # @!attribute [r] cost
      # Buyer accounting reference cost code associated with the document.
      # @return [GOBL::CBC::Code]
      property :cost, GOBL::CBC::Code

      # @!attribute [r] period
      # Period of time that the invoice document refers to often used in addition to the details provided in the individual line items.
      # @return [GOBL::Cal::Period]
      property :period, GOBL::Cal::Period

      # @!attribute [r] buyer
      # Party who is responsible for issuing payment, if not the same as the customer.
      # @return [GOBL::Org::Party]
      property :buyer, GOBL::Org::Party

      # @!attribute [r] seller
      # Seller is the party liable to pay taxes on the transaction if not the same as the supplier.
      # @return [GOBL::Org::Party]
      property :seller, GOBL::Org::Party

      # @!attribute [r] projects
      # Projects this invoice refers to.
      # @return [Array<GOBL::Org::DocumentRef>]
      property :projects, [GOBL::Org::DocumentRef]

      # @!attribute [r] contracts
      # The identification of contracts.
      # @return [Array<GOBL::Org::DocumentRef>]
      property :contracts, [GOBL::Org::DocumentRef]

      # @!attribute [r] purchases
      # Purchase orders issued by the customer or buyer.
      # @return [Array<GOBL::Org::DocumentRef>]
      property :purchases, [GOBL::Org::DocumentRef]

      # @!attribute [r] sales
      # Sales orders issued by the supplier or seller.
      # @return [Array<GOBL::Org::DocumentRef>]
      property :sales, [GOBL::Org::DocumentRef]

      # @!attribute [r] receiving
      # Receiving Advice.
      # @return [Array<GOBL::Org::DocumentRef>]
      property :receiving, [GOBL::Org::DocumentRef]

      # @!attribute [r] despatch
      # Despatch advice.
      # @return [Array<GOBL::Org::DocumentRef>]
      property :despatch, [GOBL::Org::DocumentRef]

      # @!attribute [r] tender
      # Tender advice, the identification of the call for tender or lot the invoice relates to.
      # @return [Array<GOBL::Org::DocumentRef>]
      property :tender, [GOBL::Org::DocumentRef]
    end
  end
end
