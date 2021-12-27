# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Bill
    class Payment < Dry::Struct
      # The party responsible for paying for the invoice
      attribute :payer, GOBL::Org::Party.optional

      # Payment terms or conditions.
      attribute :terms, GOBL::Pay::Terms.optional

      # Any amounts that have been paid in advance and should be deducted from the amount due.
      attribute :advances, GOBL::Types::Array(GOBL::Pay::Advance).optional

      # Details on how payment should be made.
      attribute :instructions, GOBL::Pay::Instructions.optional

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          payer: gobl['payer'] ? GOBL::Org::Party.from_gobl!(gobl['payer']) : nil,
          terms: gobl['terms'] ? GOBL::Pay::Terms.from_gobl!(gobl['terms']) : nil,
          advances: gobl['advances']&.map { |x| GOBL::Pay::Advance.from_gobl!(x) },
          instructions: gobl['instructions'] ? GOBL::Pay::Instructions.from_gobl!(gobl['instructions']) : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'payer' => attributes[:payer]&.to_gobl,
          'terms' => attributes[:terms]&.to_gobl,
          'advances' => attributes[:advances]&.map { |x| x&.to_gobl },
          'instructions' => attributes[:instructions]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
