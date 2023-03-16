# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.38.0
##

module GOBL
  module Tax
    # Total contains a set of Category Totals which in turn contain all the accumulated taxes contained in the document.
    class Total < GOBL::Object
      # The Schema ID of the GOBL Total structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/total'

      # @!attribute [r] categories
      # Grouping of all the taxes by their category
      # @return [Array<CategoryTotal>]
      property :categories, [CategoryTotal]

      # @!attribute [r] sum
      # Total value of all the taxes applied.
      # @return [GOBL::Num::Amount]
      property :sum, GOBL::Num::Amount
      validates_presence_of :sum
    end
  end
end
