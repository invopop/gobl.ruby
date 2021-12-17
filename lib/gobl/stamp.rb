# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  class Stamp < Model::Struct
    # Identity of the agency used to create the stamp
    attribute :prv, Model::Types::String

    # The serialized stamp value generated for or by the external agency
    attribute :val, Model::Types::String
  end
end
