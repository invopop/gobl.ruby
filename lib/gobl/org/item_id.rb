# frozen_string_literal: true

module GOBL
  module Org
    class ItemID < Dynamic::Base
      attribute :value, Dynamic::Types::String

      def self.refs
        @refs ||= {
          'value' => nil
        }
      end
    end
  end
end
