# frozen_string_literal: true

module GOBL
  module Tax
    class Category < Dynamic::Base
      attribute :code, Dynamic::Types::String
      attribute :name, GOBL::I18n::String
      attribute :desc, GOBL::I18n::String.optional
      attribute :retained, Dynamic::Types::Bool.optional
      attribute :defs, Dynamic::Types::Array(GOBL::Tax::Def)

      def self.refs
        @refs ||= {
          'code' => nil,
          'name' => GOBL::I18n::String,
          'desc' => GOBL::I18n::String,
          'retained' => nil,
          'defs' => GOBL::Tax::Def
        }
      end
    end
  end
end
