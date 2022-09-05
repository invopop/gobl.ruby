# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Tax
    # Region defines the holding structure for a regions categories and subsequent Rates and Values.
    class Region < GOBL::Struct
      # Name of the region
      attribute :name, GOBL::I18n::String

      # Country code for the region
      attribute :country, GOBL::L10n::CountryCode

      # Locality, city, province, county, or similar code inside the country, if needed.
      attribute? :locality, GOBL::L10n::Code.optional

      # List of sub-localities inside a region.
      attribute? :localities, Localities.optional

      # Currency used by the region for tax purposes.
      attribute :currency, GOBL::Currency::Code

      # Set of specific scheme definitions inside the region.
      attribute? :schemes, Schemes.optional

      # List of tax categories.
      attribute :categories, GOBL::Types::Array.of(Category)

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          name: GOBL::I18n::String.from_gobl!(data['name']),
          country: GOBL::L10n::CountryCode.from_gobl!(data['country']),
          locality: data['locality'] ? GOBL::L10n::Code.from_gobl!(data['locality']) : nil,
          localities: data['localities'] ? Localities.from_gobl!(data['localities']) : nil,
          currency: GOBL::Currency::Code.from_gobl!(data['currency']),
          schemes: data['schemes'] ? Schemes.from_gobl!(data['schemes']) : nil,
          categories: data['categories']&.map { |item| Category.from_gobl!(item) }
        )
      end

      def to_gobl
        {
          'name' => attributes[:name]&.to_gobl,
          'country' => attributes[:country]&.to_gobl,
          'locality' => attributes[:locality]&.to_gobl,
          'localities' => attributes[:localities]&.to_gobl,
          'currency' => attributes[:currency]&.to_gobl,
          'schemes' => attributes[:schemes]&.to_gobl,
          'categories' => attributes[:categories]&.map { |item| item&.to_gobl }
        }.compact
      end
    end
  end
end

