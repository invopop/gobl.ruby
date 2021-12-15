# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Region < Model::Struct
      attribute :code, Model::Types::String
      attribute :name, GOBL::I18n::String
      attribute :categories, Model::Types::Array(GOBL::Tax::Category)

      def self.properties_ref
        @properties_ref ||= {
          'code' => nil,
          'name' => GOBL::I18n::String,
          'categories' => GOBL::Tax::Category
        }
      end
    end
  end
end
