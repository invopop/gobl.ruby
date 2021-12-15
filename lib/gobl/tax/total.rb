# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Total < Model::Struct
      attribute :categories, Model::Types::Array(GOBL::Tax::CategoryTotal).optional
      attribute :sum, GOBL::Num::Amount
    end
  end
end
