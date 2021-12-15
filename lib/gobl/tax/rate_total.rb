# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class RateTotal < Model::Struct
      attribute :code, Model::Types::String
      attribute :base, GOBL::Num::Amount
      attribute :percent, GOBL::Num::Percentage
      attribute :value, GOBL::Num::Amount
    end
  end
end
