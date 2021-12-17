# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Rate < Model::Struct
      # From the available options for the region.
      attribute :cat, Model::Types::String

      # As defined for the region and category.
      attribute :code, Model::Types::String
    end
  end
end
