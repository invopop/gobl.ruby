# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Bill
    class Payment < Model::Struct
      # Payment terms or conditions.
      attribute :terms, GOBL::Pay::Terms.optional

      # Array of payment options that can be used to pay for this invoice.
      attribute :methods, Model::Types::Array(GOBL::Pay::Method).optional

      # The party responsible for paying for the invoice
      attribute :payer, GOBL::Org::Party.optional

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          terms: gobl['terms'],
          methods: gobl['methods'],
          payer: gobl['payer']
        )
      end

      def to_gobl
        {
          'terms' => attributes[:terms],
          'methods' => attributes[:methods],
          'payer' => attributes[:payer]
        }
      end
    end
  end
end
