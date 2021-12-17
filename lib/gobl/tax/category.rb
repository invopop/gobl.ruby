# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Category < Model::Struct
      attribute :code, Model::Types::String

      attribute :name, (Model::Types::Hash | Model::Types::Nil)

      attribute :desc, (Model::Types::Hash | Model::Types::Nil).optional

      # This tax should be retained
      attribute :retained, Model::Types::Bool.optional

      attribute :defs, Model::Types::Array(GOBL::Tax::Def)
    end
  end
end
