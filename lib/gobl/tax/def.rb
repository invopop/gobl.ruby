# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Def < Model::Struct
      attribute :code, Model::Types::String
      attribute :name, Model::Types::Any
      attribute :desc, Model::Types::Any.optional
      attribute :values, Model::Types::Array(GOBL::Tax::Value)
    end
  end
end
