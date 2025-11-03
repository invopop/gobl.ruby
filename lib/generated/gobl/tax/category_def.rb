# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
##

module GOBL
  module Tax
    # CategoryDef contains the definition of a general type of tax inside a region.
    class CategoryDef < GOBL::Object
      # The Schema ID of the GOBL CategoryDef structure
      SCHEMA_ID = 'https://gobl.org/draft-0/tax/regime-def#/$defs/CategoryDef'

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

      # @!attribute [r] informative
      # Informative when true implies that the tax amount will be calculated and reported but will not affect the invoice totals. Typically used for taxes that are embedded in the base amount or don't impact the final payable amount.
      # @return [Boolean]
      property :informative, Boolean

      # @!attribute [r] keys
      # Specific tax definitions inside this category.
      # @return [Array<KeyDef>]
      property :keys, [KeyDef]

      # @!attribute [r] rates
      # Rates defines the set of rates that can be used with this category.
      # @return [Array<RateDef>]
      property :rates, [RateDef]

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
      # @return [Array<GOBL::CBC::Source>]
      property :sources, [GOBL::CBC::Source]

      # @!attribute [r] ext
      # Extension key-value pairs that will be copied to the tax combo if this category is used.
      # @return [GOBL::Tax::Extensions]
      property :ext, GOBL::Tax::Extensions

      # @!attribute [r] meta
      # Meta contains additional information about the category that is relevant for local frequently used formats.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
