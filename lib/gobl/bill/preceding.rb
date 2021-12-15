# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Preceding < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :code, Model::Types::String
      attribute :issue_date, GOBL::Org::Date
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
