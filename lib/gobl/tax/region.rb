# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##

require 'dry-struct'

module GOBL
  module Tax
    class Region < Dry::Struct
      # Name of the region
      attribute :name, GOBL::I18n::String

      # Country code for the region
      attribute :country, GOBL::Types::String

      # Locality, city, region, or similar code inside the country, if needed.
      attribute :locality, GOBL::Types::String.optional

      # Currency used by the region for tax purposes.
      attribute :currency, GOBL::Types::String

      # Set of specific scheme definitions inside the region.
      attribute :schemes, GOBL::Types::Array(Scheme).optional

      # List of tax categories.
      attribute :categories, GOBL::Types::Array(Category)

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          name: GOBL::I18n::String.from_gobl!(data['name']),
          country: data['country'],
          locality: data['locality'],
          currency: data['currency'],
          schemes: data['schemes']&.map { |item| Scheme.from_gobl!(item) },
          categories: data['categories']&.map { |item| Category.from_gobl!(item) }
        )
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        {
          'name' => attributes[:name]&.to_gobl,
          'country' => attributes[:country],
          'locality' => attributes[:locality],
          'currency' => attributes[:currency],
          'schemes' => attributes[:schemes]&.map { |item| item&.to_gobl },
          'categories' => attributes[:categories]&.map { |item| item&.to_gobl }
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end
