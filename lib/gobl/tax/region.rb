# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.3
##


module GOBL
  module Tax
    # Region defines the holding structure for a regions categories and subsequent Rates and Values.
    class Region < GOBL::Struct
      # The Schema ID of the GOBL Region structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/region'

      # @!attribute [r] name
      # Name of the region
      # @return [GOBL::I18n::String]
      attribute :name, GOBL::I18n::String

      # @!attribute [r] country
      # Country code for the region
      # @return [GOBL::L10n::CountryCode]
      attribute :country, GOBL::L10n::CountryCode

      # @!attribute [r] locality
      # Locality, city, province, county, or similar code inside the country, if needed.
      # @return [GOBL::L10n::Code]
      attribute? :locality, GOBL::L10n::Code.optional

      # @!attribute [r] localities
      # List of sub-localities inside a region.
      # @return [Localities]
      attribute? :localities, Localities.optional

      # @!attribute [r] currency
      # Currency used by the region for tax purposes.
      # @return [GOBL::Currency::Code]
      attribute :currency, GOBL::Currency::Code

      # @!attribute [r] schemes
      # Set of specific scheme definitions inside the region.
      # @return [Schemes]
      attribute? :schemes, Schemes.optional

      # @!attribute [r] categories
      # List of tax categories.
      # @return [Array<Category>]
      attribute :categories, GOBL::Types::Array.of(Category)

      # Creates a new object from a hash of GOBL data
      #
      # @param data [Hash] a hash of GOBL data
      #
      # @return [Region] the object created from the given data
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

      # Returns a hash of GOBL data representing the current object
      #
      # @return [Hash] the array of GOBL data that represents the current object
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

      # @!method self.new(attrs)
      #
      #   Returns a {Region} object from a given hash of attributes. Nested
      #   attributes are supported: the constructor will instantiate the proper GOBL
      #   objects when nested hashes or arrays are given as part of the `attrs`
      #   parameter.
      #
      #   @param attrs [Hash] the hash of attributes
      #
      #   @return [Region] the object corresponding to the given input
    end
  end
end

