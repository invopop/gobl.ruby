# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Pay
    class Method < GOBL::Struct
      # Code for the method type that can be used.
      attribute :code, GOBL::Types::String

      # Details on how to pay using a bank transfer or wire.
      attribute :bank_transfer, GOBL::Pay::BankTransfer.optional

      # Web address that can be used for making the payment. Likely to be custom for each document.
      attribute :url, GOBL::Pay::URL.optional

      # Additional details related to this payment method.
      attribute :notes, GOBL::Types::String.optional

      # Additional non-structure data.
      attribute :meta, GOBL::Types::Hash.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          code: gobl['code'],
          bank_transfer: gobl['bank_transfer'] ? GOBL::Pay::BankTransfer.from_gobl!(gobl['bank_transfer']) : nil,
          url: gobl['url'] ? GOBL::Pay::URL.from_gobl!(gobl['url']) : nil,
          notes: gobl['notes'],
          meta: gobl['meta']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'bank_transfer' => attributes[:bank_transfer]&.to_gobl,
          'url' => attributes[:url]&.to_gobl,
          'notes' => attributes[:notes],
          'meta' => attributes[:meta]
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
