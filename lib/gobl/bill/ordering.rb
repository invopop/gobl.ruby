# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Bill
    # Ordering allows additional order details to be appended
    class Ordering < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/bill/invoice#/$defs/Ordering'

      # Party who is selling the goods and is not responsible for taxes
      attribute? :seller, GOBL::Org::Party.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          seller: data['seller'] ? GOBL::Org::Party.from_gobl!(data['seller']) : nil
        )
      end

      def to_gobl
        {
          'seller' => attributes[:seller]&.to_gobl
        }.compact
      end
    end
  end
end

