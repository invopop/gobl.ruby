# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Discount < Model::Struct
      attribute :rate, GOBL::Num::Percentage.optional
      attribute :value, GOBL::Num::Amount
      attribute :reason, Model::Types::String.optional
      attribute :code, Model::Types::String.optional
    end
  end
end
