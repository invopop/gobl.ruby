# frozen_string_literal: true

################################################
# DO NOT EDIT - Auto generated code            #
################################################

module GOBL
  module Tax
    class Category < Model::Struct
      attribute :code, Model::Types::String
      attribute :name, GOBL::I18n::String
      attribute :desc, GOBL::I18n::String.optional
      attribute :retained, Model::Types::Bool.optional
      attribute :defs, Model::Types::Array(GOBL::Tax::Def)

      def self.properties_ref
        @properties_ref ||= {
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
