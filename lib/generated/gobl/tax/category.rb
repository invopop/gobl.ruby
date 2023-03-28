# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.39.0
##

module GOBL
  module Tax
    # Category contains the definition of a general type of tax inside a region.
    class Category < GOBL::Object
      # The Schema ID of the GOBL Category structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime#/$defs/Category'

      # @!attribute [r] code
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code
      validates_presence_of :code

      # @!attribute [r] name
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates_presence_of :name

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
      validates_presence_of :rates

      # @!attribute [r] tags
      # Tags contains a set of tag definitions that can be applied for this tax category.
      # @return [Array<Tag>]
      property :tags, [Tag]

      # @!attribute [r] meta
      # Meta contains additional information about the category that is relevant for local frequently used formats.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
