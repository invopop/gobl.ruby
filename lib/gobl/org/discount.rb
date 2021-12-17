# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Org
    class Discount < Model::Struct
      attribute :rate, Model::Types::String.optional

      # How much to deduct
      attribute :value, Model::Types::String

      # Description as to why this discount was applied.
      attribute :reason, Model::Types::String.optional

      # Reason Code
      attribute :code, Model::Types::String.optional
    end
  end
end
