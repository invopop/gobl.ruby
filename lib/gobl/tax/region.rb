# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Region < Model::Struct
      attribute :code, Model::Types::String
      attribute :name, Model::Types::Any
      attribute :categories, Model::Types::Array(GOBL::Tax::Category)
    end
  end
end
