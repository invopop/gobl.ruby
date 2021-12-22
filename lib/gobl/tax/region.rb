# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class Region < Model::Struct
      attribute :code, Model::Types::String

      attribute :name, GOBL::I18n::String

      attribute :categories, Model::Types::Array(GOBL::Tax::Category)

      def self.from_gobl!(gobl)
        gobl = Model::Types::Hash[gobl]

        new(
          code: gobl['code'],
          name: GOBL::I18n::String.from_gobl!(gobl['name']),
          categories: gobl['categories']&.map { |x| GOBL::Tax::Category.from_gobl!(x) }
        )
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'name' => attributes[:name]&.to_gobl,
          'categories' => attributes[:categories]&.map { |x| x&.to_gobl }
        }
      end
    end
  end
end
