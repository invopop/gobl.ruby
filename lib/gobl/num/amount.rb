# frozen_string_literal: true

module GOBL
  module Num
    class Amount < Dynamic::Base
      attribute :value, Dynamic::Types::Any.optional

      def self.refs
        @refs ||= {

        }
      end
    end
  end
end
