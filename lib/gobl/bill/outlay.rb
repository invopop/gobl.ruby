# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Bill
    class Outlay < Model::Struct
      attribute :uuid, Model::Types::String.optional

      # Line number inside the invoice
      attribute :i, Model::Types::Int

      # A code
      attribute :ref, Model::Types::String.optional

      # Details on what the outlay was.
      attribute :desc, Model::Types::String

      # Amount paid by the supplier.
      attribute :paid, GOBL::Num::Amount

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          i: gobl['i'],
          ref: gobl['ref'],
          desc: gobl['desc'],
          paid: GOBL::Num::Amount.from_gobl!(gobl['paid'])
        )
      end

      def to_gobl
        {
          'uuid' => attributes[:uuid],
          'i' => attributes[:i],
          'ref' => attributes[:ref],
          'desc' => attributes[:desc],
          'paid' => attributes[:paid]&.to_gobl
        }
      end
    end
  end
end
