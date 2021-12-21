# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Bill
    class Ordering < Model::Struct
      # Party who is selling the goods and is not responsible for taxes.
      attribute :seller, GOBL::Org::Party.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          seller: gobl['seller'] ? GOBL::Org::Party.from_gobl!(gobl['seller']) : nil
        )
      end

      def to_gobl
        {
          'seller' => attributes[:seller]
        }
      end
    end
  end
end
