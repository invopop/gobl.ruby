# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class TaxID < Model::Struct
      # Unique identity code
      attribute :uuid, Model::Types::String.optional

      # ISO country code for Where the tax identity was issued.
      attribute :country, Model::Types::String

      # Identity code.
      attribute :code, Model::Types::String

      # Additional details.
      attribute :meta, Model::Types::Hash.optional
    end
  end
end
