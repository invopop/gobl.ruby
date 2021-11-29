# frozen_string_literal: true

module GOBL
  module Tax
    class Rate < Dynamic::Base
      attribute :cat, Dynamic::Types::String
      attribute :code, Dynamic::Types::String

      def self.refs
        @refs ||= {
          'cat' => nil,
          'code' => nil
        }
      end
    end
  end
end
