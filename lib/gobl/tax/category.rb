# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Category < Model::Struct
      attribute :code, Model::Types::String
      attribute :name, Model::Types::Any
      attribute :desc, Model::Types::Any.optional
      attribute :retained, Model::Types::Bool.optional
      attribute :defs, Model::Types::Array(GOBL::Tax::Def)
    end
  end
end
