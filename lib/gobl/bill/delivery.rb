# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Bill
    class Delivery < Model::Struct
      # The party who will receive delivery of the goods defined in the invoice and is not responsible for taxes.
      attribute :receiver, GOBL::Org::Party.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          receiver: gobl['receiver'] ? GOBL::Org::Party.from_gobl!(gobl['receiver']) : nil
        )
      end

      def to_gobl
        {
          'receiver' => attributes[:receiver]&.to_gobl
        }
      end
    end
  end
end
