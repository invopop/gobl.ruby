# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class CategoryTotal < Model::Struct
      attribute :code, Model::Types::String

      attribute :retained, Model::Types::Bool.optional

      attribute :rates, Model::Types::Array(GOBL::Tax::RateTotal)

      attribute :base, Model::Types::String

      attribute :value, Model::Types::String
    end
  end
end
