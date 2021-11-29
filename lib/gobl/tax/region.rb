# frozen_string_literal: true

module GOBL
  module Tax
    class Region < Dynamic::Base
      attribute :code, Dynamic::Types::String
      attribute :name, GOBL::I18n::String
      attribute :categories, Dynamic::Types::Array(GOBL::Tax::Category)

      def self.refs
        @refs ||= {
          'code' => nil,
          'name' => GOBL::I18n::String,
          'categories' => GOBL::Tax::Category
        }
      end
    end
  end
end
