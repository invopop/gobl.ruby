# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  class Envelope < Model::Struct
    attribute :head, GOBL::Header
    attribute :doc, Model::Types::Hash
    attribute :sigs, Model::Types::Array(Model::Types::String)
  end
end
