# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # Category contains the definition of a general type of tax inside a region.
    class Category < GOBL::Object
      # The Schema ID of the GOBL Category structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime#/$defs/Category'

      # @!attribute [r] code
      # Code to be used in documents
      # @return [GOBL::CBC::Code]
      property :code, GOBL::CBC::Code
      validates_presence_of :code

      # @!attribute [r] name
      # Short name of the category to be used instead of code in output
      # @return [GOBL::I18n::String]
      property :name, GOBL::I18n::String
      validates_presence_of :name

      # @!attribute [r] title
      # Human name for the code to use for titles
      # @return [GOBL::I18n::String]
      property :title, GOBL::I18n::String

      # @!attribute [r] desc
      # Useful description of the category.
      # @return [GOBL::I18n::String]
      property :desc, GOBL::I18n::String

      # @!attribute [r] retained
      # Retained when true implies that the tax amount will be retained by the buyer on behalf of the supplier, and thus subtracted from the invoice taxable base total. Typically used for taxes related to income.
      # @return [Boolean]
      property :retained, Boolean

      # @!attribute [r] rate_required
      # RateRequired when true implies that when a tax combo is defined using this category that one of the rate's keys must be defined. This is normally needed for regimes that categorize taxes in local document formats as opposed to grouping by percentage values. Try to avoid using this. It is better for rates to be determined by the percentage and conditions, not the rate key.
      # @return [Boolean]
      property :rate_required, Boolean

      # @!attribute [r] rates
      # Specific tax definitions inside this category.
      # @return [Array<Rate>]
      property :rates, [Rate]

      # @!attribute [r] extensions
      # Extensions defines a list of extension keys that may be used or required as an alternative or alongside choosing a rate for the tax category. Every key must be defined in the Regime's extensions table.
      # @return [Array<GOBL::CBC::Key>]
      property :extensions, [GOBL::CBC::Key]

      # @!attribute [r] map
      # Map defines a set of regime specific code mappings.
      # @return [GOBL::CBC::CodeMap]
      property :map, GOBL::CBC::CodeMap

      # @!attribute [r] sources
      # List of sources for the information contained in this category.
      # @return [Array<Source>]
      property :sources, [Source]

      # @!attribute [r] meta
      # Meta contains additional information about the category that is relevant for local frequently used formats.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
