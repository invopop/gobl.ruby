# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Party < Model::Struct
      # Unique identity code.
      attribute :uuid, Model::Types::String.optional

      # The entity's legal ID code used for tax purposes. They may have other numbers
      attribute :tax_id, GOBL::Org::TaxID.optional

      # Legal name or representation of the organization.
      attribute :name, Model::Types::String

      # Alternate short name.
      attribute :alias, Model::Types::String.optional

      # Details of physical people who represent the party.
      attribute :people, Model::Types::Array(GOBL::Org::Person).optional

      # Regular post addresses for where information should be sent if needed.
      attribute :addresses, Model::Types::Array(GOBL::Org::Address).optional

      attribute :emails, Model::Types::Array(GOBL::Org::Email).optional

      attribute :telephones, Model::Types::Array(GOBL::Org::Telephone).optional

      # Any additional non-structure information that does not fit into the rest of the document.
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
