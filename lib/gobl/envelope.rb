# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  class Envelope < Model::Struct
    # Details on what the contents are
    attribute :head, GOBL::Header

    # The data being enveloped
    attribute :doc, Model::Types::Hash

    # JSON Web Signatures of the header
    attribute :sigs, Model::Types::Array(Model::Types::String)
  end
end
