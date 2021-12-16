# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Def < Model::Struct
      attribute :code, Model::Types::String
      attribute :name, (Model::Types::Hash | Model::Types::Nil)
      attribute :desc, (Model::Types::Hash | Model::Types::Nil).optional
      attribute :values, Model::Types::Array(GOBL::Tax::Value)
    end
  end
end
