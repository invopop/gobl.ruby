# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

module GOBL
  module Tax
    # Category contains the definition of a general type of tax inside a region.
    class Category < GOBL::Struct
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/region#/$defs/Category'

      # @!attribute [r] code
      # @return [GOBL::Org::Code]
      attribute :code, GOBL::Org::Code

      # @!attribute [r] name
      # @return [GOBL::I18n::String]
      attribute :name, GOBL::I18n::String

      # @!attribute [r] desc
      # @return [GOBL::I18n::String]
      attribute? :desc, GOBL::I18n::String.optional

      # @!attribute [r] retained
      # Retained when true implies that the tax amount will be retained by the buyer on behalf of the supplier, and thus subtracted from the invoice taxable base total. Typically used for taxes related to income.
      # @return [Boolean]
      attribute? :retained, GOBL::Types::Bool.optional

      # @!attribute [r] rates
      # Specific tax definitions inside this category.
      # @return [Array<Rate>]
      attribute :rates, GOBL::Types::Array.of(Rate)

      def self.from_gobl!(data)
        data = GOBL::Types::Hash[data]

        new(
          code: GOBL::Org::Code.from_gobl!(data['code']),
          name: GOBL::I18n::String.from_gobl!(data['name']),
          desc: data['desc'] ? GOBL::I18n::String.from_gobl!(data['desc']) : nil,
          retained: data['retained'],
          rates: data['rates']&.map { |item| Rate.from_gobl!(item) }
        )
      end

      def to_gobl
        {
          'code' => attributes[:code]&.to_gobl,
          'name' => attributes[:name]&.to_gobl,
          'desc' => attributes[:desc]&.to_gobl,
          'retained' => attributes[:retained],
          'rates' => attributes[:rates]&.map { |item| item&.to_gobl }
        }.compact
      end
    end
  end
end

