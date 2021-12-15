# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Def < Model::Struct
      attribute :code, Model::Types::String
      attribute :name, GOBL::I18n::String
      attribute :desc, GOBL::I18n::String.optional
      attribute :values, Model::Types::Array(GOBL::Tax::Value)
    end
  end
end
