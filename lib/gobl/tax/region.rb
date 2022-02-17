# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Tax
    class Region < Dry::Struct
      attribute :code, GOBL::Types::String

      attribute :name, GOBL::I18n::String

      attribute :categories, GOBL::Types::Array(Category)

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          code: data['code'],
          name: GOBL::I18n::String.from_gobl!(data['name']),
          categories: data['categories']&.map { |item| Category.from_gobl!(item) }
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'name' => attributes[:name]&.to_gobl,
          'categories' => attributes[:categories]&.map { |item| item&.to_gobl }
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
