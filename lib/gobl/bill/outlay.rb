# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Outlay < Dry::Struct
      # Unique identity for this outlay.
      attribute :uuid, GOBL::Types::String.optional

      # Outlay number index inside the invoice for ordering.
      attribute :i, GOBL::Types::Int

      # A code, invoice number, or other reference detail used to identify the outlay.
      attribute :ref, GOBL::Types::String.optional

      # Details on what the outlay was.
      attribute :desc, GOBL::Types::String

      # Amount paid by the supplier.
      attribute :paid, GOBL::Num::Amount

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          uuid: gobl['uuid'],
          i: gobl['i'],
          ref: gobl['ref'],
          desc: gobl['desc'],
          paid: GOBL::Num::Amount.from_gobl!(gobl['paid'])
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
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

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
