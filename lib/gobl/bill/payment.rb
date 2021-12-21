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
          terms: gobl['terms'] ? GOBL::Pay::Terms.from_gobl!(gobl['terms']) : nil,
          methods: gobl['methods']&.map { |x| GOBL::Pay::Method.from_gobl!(x) },
          payer: gobl['payer'] ? GOBL::Org::Party.from_gobl!(gobl['payer']) : nil
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
