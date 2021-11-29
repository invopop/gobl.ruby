# frozen_string_literal: true

module GOBL
  class Envelope < Dynamic::Base
    attribute :head, GOBL::Header
    attribute :doc, GOBL::Payload
    attribute :sigs, Dynamic::Types::Array(GOBL::Dsig::Signature)

    def self.refs
      @refs ||= {
        'head' => GOBL::Header,
        'doc' => GOBL::Payload,
        'sigs' => GOBL::Dsig::Signature
      }
    end
  end
end
