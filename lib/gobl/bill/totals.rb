# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Totals < Model::Struct
      attribute :sum, GOBL::Num::Amount
      attribute :discount, GOBL::Num::Amount.optional
      attribute :total, GOBL::Num::Amount.optional
      attribute :taxes, GOBL::Tax::Total.optional
      attribute :outlays, GOBL::Num::Amount.optional
      attribute :payable, GOBL::Num::Amount
    end
  end
end
