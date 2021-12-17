# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Bill
    class Outlay < Model::Struct
      attribute :uuid, Model::Types::String.optional

      # Line number inside the invoice
      attribute :i, Model::Types::Int

      # A code
      attribute :ref, Model::Types::String.optional

      # Details on what the outlay was.
      attribute :desc, Model::Types::String

      # Amount paid by the supplier.
      attribute :paid, Model::Types::String
    end
  end
end
