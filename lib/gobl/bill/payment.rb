# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Payment < Dry::Struct
      # Payment terms or conditions.
      attribute :terms, GOBL::Pay::Terms.optional

      # Array of payment options that can be used to pay for this invoice.
      attribute :methods, GOBL::Types::Array(GOBL::Pay::Method).optional

      # The party responsible for paying for the invoice
      attribute :payer, GOBL::Org::Party.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          terms: gobl['terms'] ? GOBL::Pay::Terms.from_gobl!(gobl['terms']) : nil,
          methods: gobl['methods']&.map { |x| GOBL::Pay::Method.from_gobl!(x) },
          payer: gobl['payer'] ? GOBL::Org::Party.from_gobl!(gobl['payer']) : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'terms' => attributes[:terms]&.to_gobl,
          'methods' => attributes[:methods]&.map { |x| x&.to_gobl },
          'payer' => attributes[:payer]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
