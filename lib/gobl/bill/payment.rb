# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.24.0
##

require 'dry-struct'

module GOBL
  module Bill
    # Payment contains details as to how the invoice should be paid.
    class Payment < Dry::Struct
      # The party responsible for paying for the invoice, if not the customer.
      attribute :payer, GOBL::Org::Party.optional

      # Payment terms or conditions.
      attribute :terms, GOBL::Pay::Terms.optional

      # Any amounts that have been paid in advance and should be deducted from the amount due.
      attribute :advances, Advances.optional

      # Details on how payment should be made.
      attribute :instructions, GOBL::Pay::Instructions.optional

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          payer: data['payer'] ? GOBL::Org::Party.from_gobl!(data['payer']) : nil,
          terms: data['terms'] ? GOBL::Pay::Terms.from_gobl!(data['terms']) : nil,
          advances: data['advances'] ? Advances.from_gobl!(data['advances']) : nil,
          instructions: data['instructions'] ? GOBL::Pay::Instructions.from_gobl!(data['instructions']) : nil
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'payer' => attributes[:payer]&.to_gobl,
          'terms' => attributes[:terms]&.to_gobl,
          'advances' => attributes[:advances]&.to_gobl,
          'instructions' => attributes[:instructions]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

