# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.24.0
##

require 'dry-struct'

module GOBL
  module Tax
    # Region defines the holding structure for a regions categories and subsequent Rates and Values.
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
      attribute :schemes, Schemes.optional

      # List of tax categories.
      attribute :categories, GOBL::Types::Array.of(Category)

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          name: GOBL::I18n::String.from_gobl!(data['name']),
          country: data['country'],
          locality: data['locality'],
          currency: data['currency'],
          schemes: data['schemes'] ? Schemes.from_gobl!(data['schemes']) : nil,
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
          'schemes' => attributes[:schemes]&.to_gobl,
          'categories' => attributes[:categories]&.map { |item| item&.to_gobl }
        }
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end
    end
  end
end

