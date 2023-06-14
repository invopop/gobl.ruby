# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.50.5
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

      # @!attribute [r] rate_required
      # RateRequired when true implies that when a tax combo is defined using this category that one of the rates must be defined.
      # @return [Boolean]
      property :rate_required, Boolean

      # @!attribute [r] rates
      # Specific tax definitions inside this category.
      # @return [Array<Rate>]
      property :rates, [Rate]

      # @!attribute [r] codes
      # Codes defines a set of regime specific code mappings.
      # @return [GOBL::CBC::CodeSet]
      property :codes, GOBL::CBC::CodeSet

      # @!attribute [r] meta
      # Meta contains additional information about the category that is relevant for local frequently used formats.
      # @return [GOBL::CBC::Meta]
      property :meta, GOBL::CBC::Meta
    end
  end
end
