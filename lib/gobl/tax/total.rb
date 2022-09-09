# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Tax
    # Total contains a set of Category Totals which in turn contain all the accumulated taxes contained in the document.
    class Total < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/total'

      # @!attribute [r] categories
      # Grouping of all the taxes by their category
      # @return [Array<CategoryTotal>]
      attribute? :categories, GOBL::Types::Array.of(CategoryTotal).optional

      # @!attribute [r] sum
      # Total value of all the taxes applied.
      # @return [GOBL::Num::Amount]
      attribute :sum, GOBL::Types.Constructor(GOBL::Num::Amount)

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          categories: data['categories']&.map { |item| CategoryTotal.from_gobl!(item) },
          sum: data['sum']
        )
      end

      def to_gobl
        {
          'categories' => attributes[:categories]&.map { |item| item&.to_gobl },
          'sum' => attributes[:sum]&.to_gobl
        }.compact
      end
    end
  end
end

