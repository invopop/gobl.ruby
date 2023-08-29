# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.55.0
##

module GOBL
  module Tax
    # CategoryTotal groups together all rates inside a given category.
    class CategoryTotal < GOBL::Object
      # The Schema ID of the GOBL CategoryTotal structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/total#/$defs/CategoryTotal'

      # @!attribute [r] code
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code
      validates_presence_of :code

      # @!attribute [r] retained
      # @return [Boolean]
      property :retained, Boolean

      # @!attribute [r] rates
      # @return [Array<RateTotal>]
      property :rates, [RateTotal]
      validates_presence_of :rates

      # @!attribute [r] amount
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount
      validates_presence_of :amount

      # @!attribute [r] surcharge
      # @return [GOBL::Num::Amount]
      property :surcharge, GOBL::Num::Amount
    end
  end
end
