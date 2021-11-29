# frozen_string_literal: true

module GOBL
  module Pay
    class Terms < Dynamic::Base
      attribute :code, Dynamic::Types::String
      attribute :notes, GOBL::I18n::String.optional

      def self.refs
        @refs ||= {
          'code' => nil,
          'notes' => GOBL::I18n::String
        }
      end
    end
  end
end
