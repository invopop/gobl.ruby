# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.31.0
##

module GOBL
  module Tax
    # Category contains the definition of a general type of tax inside a region.
    class Category < GOBL::Object
      # The Schema ID of the GOBL Category structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/region#/$defs/Category'

      # @!attribute [r] code
      # @return [GOBL::Org::Code]
      property :code, GOBL::Org::Code
      validates :code, presence: true

      # @!attribute [r] name
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates :name, presence: true

      # @!attribute [r] desc
      # @return [GOBL::I18n::String]
      property :desc, GOBL::I18n::String

      # @!attribute [r] retained
      # Retained when true implies that the tax amount will be retained by the buyer on behalf of the supplier, and thus subtracted from the invoice taxable base total. Typically used for taxes related to income.
      # @return [Boolean]
      property :retained, Boolean

      # @!attribute [r] rates
      # Specific tax definitions inside this category.
      # @return [Array<Rate>]
      property :rates, [Rate]
      validates :rates, presence: true
    end
  end
end
