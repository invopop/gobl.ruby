# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Pay
    class Method < Model::Struct
      # Code for the method type that can be used.
      attribute :code, Model::Types::String

      # Details on how to pay using a bank transfer or wire.
      attribute :bank_transfer, GOBL::Pay::BankTransfer.optional

      # Web address that can be used for making the payment. Likely to be custom for each document.
      attribute :url, GOBL::Pay::URL.optional

      # Additional details related to this payment method.
      attribute :notes, Model::Types::String.optional

      # Additional non-structure data.
      attribute :meta, Model::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          code: gobl['code'],
          bank_transfer: gobl['bank_transfer'],
          url: gobl['url'],
          notes: gobl['notes'],
          meta: gobl['meta']
        )
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'bank_transfer' => attributes[:bank_transfer],
          'url' => attributes[:url],
          'notes' => attributes[:notes],
          'meta' => attributes[:meta]
        }
      end
    end
  end
end
