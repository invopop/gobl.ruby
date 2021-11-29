# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  class Envelope < Dynamic::Struct
    attribute :head, GOBL::Header
    attribute :doc, GOBL::Payload
    attribute :sigs, Dynamic::Types::Array(GOBL::Dsig::Signature)

    def self.properties_ref
      @properties_ref ||= {
        'head' => GOBL::Header,
        'doc' => GOBL::Payload,
        'sigs' => GOBL::Dsig::Signature
      }
    end
  end
end
