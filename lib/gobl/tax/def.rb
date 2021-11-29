# frozen_string_literal: true

module GOBL
  module Tax
    class Def < Dynamic::Base
      attribute :code, Dynamic::Types::String
      attribute :name, GOBL::I18n::String
      attribute :desc, GOBL::I18n::String.optional
      attribute :values, Dynamic::Types::Array(GOBL::Tax::Value)

      def self.refs
        @refs ||= {
          'code' => nil,
          'name' => GOBL::I18n::String,
          'desc' => GOBL::I18n::String,
          'values' => GOBL::Tax::Value
        }
      end
    end
  end
end
