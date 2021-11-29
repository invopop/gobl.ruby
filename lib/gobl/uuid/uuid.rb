# frozen_string_literal: true

module GOBL
  module UUID
    class UUID < Dynamic::Base
      attribute :value, Dynamic::Types::Any.optional

      def self.refs
        @refs ||= {

        }
      end
    end
  end
end
