# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Preceding < Model::Struct
      attribute :uuid, Model::Types::String.optional
      attribute :code, Model::Types::String
      attribute :issue_date, Model::Types::String
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
