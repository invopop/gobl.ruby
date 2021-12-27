# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

module GOBL
  module Tax
    class Region < GOBL::Struct
      attribute :code, GOBL::Types::String

      attribute :name, GOBL::I18n::String

      attribute :categories, GOBL::Types::Array(GOBL::Tax::Category)

      def self.from_gobl!(gobl)
        gobl = GOBL::Types::Hash[gobl]

        new(
          code: gobl['code'],
          name: GOBL::I18n::String.from_gobl!(gobl['name']),
          categories: gobl['categories']&.map { |x| GOBL::Tax::Category.from_gobl!(x) }
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'code' => attributes[:code],
          'name' => attributes[:name]&.to_gobl,
          'categories' => attributes[:categories]&.map { |x| x&.to_gobl }
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
