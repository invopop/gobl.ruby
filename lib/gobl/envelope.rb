# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  class Envelope < Model::Struct
    attribute :head, GOBL::Header
    attribute :doc, GOBL::Payload
    attribute :sigs, Model::Types::Array(GOBL::Dsig::Signature)
  end
end
