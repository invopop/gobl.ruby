# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Party < Model::Struct
      attribute :uuid, GOBL::UUID::UUID.optional
      attribute :tax_id, GOBL::Org::TaxID.optional
      attribute :name, Model::Types::String
      attribute :alias, Model::Types::String.optional
      attribute :people, Model::Types::Array(GOBL::Org::Person).optional
      attribute :addresses, Model::Types::Array(GOBL::Org::Address).optional
      attribute :emails, Model::Types::Array(GOBL::Org::Email).optional
      attribute :telephones, Model::Types::Array(GOBL::Org::Telephone).optional
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
