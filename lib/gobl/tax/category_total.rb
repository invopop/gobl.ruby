# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.32.0
##

module GOBL
  module Tax
    # CategoryTotal groups together all rates inside a given category.
    class CategoryTotal < GOBL::Object
      # The Schema ID of the GOBL CategoryTotal structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/total#/$defs/CategoryTotal'

      # @!attribute [r] code
      # @return [GOBL::Org::Code]
      property :code, GOBL::Org::Code
      validates :code, presence: true

      # @!attribute [r] retained
      # @return [Boolean]
      property :retained, Boolean

      # @!attribute [r] rates
      # @return [Array<RateTotal>]
      property :rates, [RateTotal]
      validates :rates, presence: true

      # @!attribute [r] base
      # @return [GOBL::Num::Amount]
      property :base, GOBL::Num::Amount
      validates :base, presence: true

      # @!attribute [r] amount
      # @return [GOBL::Num::Amount]
      property :amount, GOBL::Num::Amount
      validates :amount, presence: true

      # @!attribute [r] surcharge
      # @return [GOBL::Num::Amount]
      property :surcharge, GOBL::Num::Amount
    end
  end
end
