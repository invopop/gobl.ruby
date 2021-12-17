# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Value < Model::Struct
      # Date from which this value should be applied.
      attribute :since, Model::Types::String.optional

      # Rate that should be applied.
      attribute :percent, Model::Types::String

      # When true
      attribute :disabled, Model::Types::Bool.optional
    end
  end
end
