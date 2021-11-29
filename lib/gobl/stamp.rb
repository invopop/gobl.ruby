# frozen_string_literal: true

module GOBL
  class Stamp < Dynamic::Base
    attribute :prv, Dynamic::Types::String
    attribute :val, Dynamic::Types::String

    def self.refs
      @refs ||= {
        'prv' => nil,
        'val' => nil
      }
    end
  end
end
