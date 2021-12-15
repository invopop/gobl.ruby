# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Totals < Model::Struct
      attribute :sum, Model::Types::String
      attribute :discount, Model::Types::String.optional
      attribute :total, Model::Types::String.optional
      attribute :taxes, GOBL::Tax::Total.optional
      attribute :outlays, Model::Types::String.optional
      attribute :payable, Model::Types::String
    end
  end
end
