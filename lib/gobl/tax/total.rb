# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Total < Model::Struct
      attribute :categories, Model::Types::Array(GOBL::Tax::CategoryTotal).optional

      # Total value of all the taxes to be added or retained.
      attribute :sum, Model::Types::String
    end
  end
end
