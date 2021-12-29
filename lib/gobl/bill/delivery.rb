# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Delivery < Dry::Struct
      # The party who will receive delivery of the goods defined in the invoice and is not responsible for taxes.
      attribute :receiver, GOBL::Org::Party.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          receiver: gobl['receiver'] ? GOBL::Org::Party.from_gobl!(gobl['receiver']) : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'receiver' => attributes[:receiver]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
