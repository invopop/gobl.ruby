# frozen_string_literal: true

module GOBL
  class Payload < Dynamic::Base
    attribute :value, Dynamic::Types::Any.optional

    def self.refs
      @refs ||= {

      }
    end
  end
end
