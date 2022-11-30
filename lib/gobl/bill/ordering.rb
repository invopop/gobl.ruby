# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.32.0
##

module GOBL
  module Bill
    # Ordering allows additional order details to be appended
    class Ordering < GOBL::Object
      # The Schema ID of the GOBL Ordering structure
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Ordering'

      # @!attribute [r] seller
      # Party who is selling the goods and is not responsible for taxes
      # @return [GOBL::Org::Party]
      property :seller, GOBL::Org::Party
    end
  end
end
