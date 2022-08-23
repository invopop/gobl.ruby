# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

require 'dry-struct'

module GOBL
  module Tax
    # Total contains a set of Category Totals which in turn contain all the accumulated taxes contained in the document.
    class Total < Dry::Struct
      # Grouping of all the taxes by their category
      attribute :categories, GOBL::Types::Array.of(CategoryTotal).optional

      # Total value of all the taxes applied.
      attribute :sum, GOBL::Types.Constructor(GOBL::Num::Amount)

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          categories: data['categories']&.map { |item| CategoryTotal.from_gobl!(item) },
          sum: data['sum']
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'categories' => attributes[:categories]&.map { |item| item&.to_gobl },
          'sum' => attributes[:sum]&.to_gobl
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

